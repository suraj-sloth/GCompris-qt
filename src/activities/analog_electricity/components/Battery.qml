/* GCompris - Battery.qml
 *
 * Copyright (C) 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com> (Qt Quick port)
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.6
import GCompris 1.0
import "../analog_electricity.js" as Activity

ElectricalComponent {
    id: battery
    terminalSize: 0.2
    noOfConnectionPoints: 2
    information: qsTr("Battery is the voltage source. It is the supply voltage of the circuit.")

    property var nodeVoltages: [0, 0]
    property double current: 0
    onCurrentChanged: console.log("battery current is " + current)
    property alias connectionPoints: connectionPoints
    property var connectionPointPosY: [0, 1]
    property var connectionPointType: ["positive", "negative"]
    property string componentName: "Voltage"
    property var externalNetlistIndex: [0, 0]
    property var netlistModel:
    [
        "v",
        [
        ],
        {
            "name": componentName,
            "value": "dc(10)",
            "_json_": 0
        },
        [
            0,
            0
        ]
    ];

    Repeater {
        id: connectionPoints
        model: 2
        delegate: connectionPoint
        Component {
            id: connectionPoint
            TerminalPoint {
                posX: 0.5
                posY: connectionPointPosY[index]
                terminalType: connectionPointType[index]
            }
        }
    }

    function initConnections() {
        var connectionIndex = Activity.connectionCount
        battery.externalNetlistIndex[0] = ++connectionIndex
        connectionPoints.itemAt(0).updateNetlistIndex(connectionIndex)
        battery.externalNetlistIndex[1] = ++connectionIndex
        connectionPoints.itemAt(1).updateNetlistIndex(connectionIndex)
        Activity.connectionCount = connectionIndex
    }

    function addToNetlist() {
        var netlistItem = battery.netlistModel;
        Activity.netlistComponents.push(battery);
        Activity.vSourcesList.push(battery);
        netlistItem[2].name = componentName
        netlistItem[2]._json = Activity.netlist.length;
        netlistItem[3][0] = battery.externalNetlistIndex[0]
        netlistItem[3][1] = battery.externalNetlistIndex[1]
        Activity.netlist.push(netlistItem);
    }
}
