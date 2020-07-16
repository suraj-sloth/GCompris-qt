/* GCompris - Bulb.qml
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
    id: bulb
    terminalSize: 0.2
    noOfConnectionPoints: 2

    information: qsTr("lightBulb.")

    property alias connectionPoints: connectionPoints
    property var connectionPointPosX: [0.2, 0.8]
    property var netlistModel:
[
    "r",
    [
    ],
    {
      "name": "Bulb",
      "r": "3",
      "_json_": 0
    },
    [
      0,
      0
    ]
]

    Repeater {
        id: connectionPoints
        model: 2
        delegate: connectionPoint
        Component {
//             component: nodeXs.count > 0 ? nodeXs.itemAt(0).width : 0;
            id: connectionPoint
            TerminalPoint {
                posX: connectionPointPosX[index]
                posY: 1
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

