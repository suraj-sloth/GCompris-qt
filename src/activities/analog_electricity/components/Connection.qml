/* GCompris - Connection.qml
 *
 * SPDX-FileCopyrightText: 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com> (Qt Quick port)
 *
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */
import QtQuick 2.6
import GCompris 1.0
import "../analog_electricity.js" as Activity

ElectricalComponent {
    id: connection
    terminalSize: 0.2
    noOfConnectionPoints: 1
    information: qsTr("A simple connection point to connect several wires in an electrical circuit.")
    source: Activity.url + "connection.svg"

    property alias connectionPoints: connectionPoints
    property string componentName: "Connection"
    property var externalNetlistIndex: [0]
    property bool inConnectedComponents: false

    Repeater {
        id: connectionPoints
        model: 1
        delegate: connectionPoint
        Component {
            id: connectionPoint
            TerminalPoint {
                posX: 0.5
                posY: 0.5
            }
        }
    }

    function checkConnections() {
        terminalConnected = 0;

        if(connectionPoints.itemAt(0).wires.length > 0) {
            terminalConnected += 1;
        }
    }

    function updateValues() {
        return;
    }

    function initConnections() {
        var connectionIndex = Activity.connectionCount;
        connection.externalNetlistIndex[0] = ++connectionIndex;
        connectionPoints.itemAt(0).updateNetlistIndex(connectionIndex);
        Activity.connectionCount = connectionIndex;
    }

    function addToNetlist() {
        return;
    }

    function checkConnectedComponents() {
        var terminal = connectionPoints.itemAt(0);
        for(var j = 0; j < terminal.wires.length; ++j) {
            var wire = terminal.wires[j];
            var connectedComponent1 = wire.node1.parent;
            var connectedComponent2 = wire.node2.parent;

            if(connectedComponent1 === terminal.parent && connectedComponent1.inConnectedComponents === false && connectedComponent1.terminalConnected >= 1) {
                connectedComponent1.inConnectedComponents = true;
                Activity.connectedComponents.push(connectedComponent1);
                connectedComponent2.checkConnectedComponents();
            } else if(connectedComponent2 === terminal.parent && connectedComponent2.inConnectedComponents === false && connectedComponent2.terminalConnected >= 1) {
                connectedComponent2.inConnectedComponents = true;
                Activity.connectedComponents.push(connectedComponent2);
                connectedComponent1.checkConnectedComponents();
            } else
                break;
        }
    }

}
