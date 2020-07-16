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

ElectricalComponent {
    id: battery
    terminalSize: 0.2
    noOfConnectionPoints: 2
    information: qsTr("Battery is the voltage source. It is the supply voltage of the circuit.")

    property alias connectionPoints: connectionPoints
    property var connectionPointPosY: [0, 1]
    property var netlistModel:
    [
        "v",
        [
        ],
        {
            "name": "Voltage",
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
            }
        }
    }

//     function updateOutput(wireVisited) {
//          var terminal = connectionPoints.itemAt(0)
//         terminal.value = (nodeXs.itemAt(0).wires.length != 0) ? !nodeXs.itemAt(0).value : 0
//         for(var i = 0 ; i < terminal.wires.length ; ++i)
//             terminal.wires[i].to.value = terminal.value
// 
//         var componentVisited = []
//         for(var i = 0 ; i < terminal.wires.length ; ++i) {
//             var wire = terminal.wires[i]
//             var component = wire.node2.parent
//             if(componentVisited[component] != true && wireVisited[wire] != true) {
//                 componentVisited[component] = true
//                 wireVisited[wire] = true
//                 component.updateOutput(wireVisited)
//             }
//         }
//     }
}
