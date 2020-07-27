/* GCompris - TerminalPoint.qml
 *
 * Copyright (C) 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Pulkit Gupta <pulkitnsit@gmail.com> (Qt Quick port)
 *   Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com> (AnalogElectricity activity)
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

Image {
    id: terminalPoint

    property double posX
    property double posY
    property double size: parent.terminalSize
    property bool selected: false
    property int value: 0
    property var wires: []
    property int netlistIndex: 0
    property string terminalType: "noPolarity"

    width: size * parent.paintedHeight
    height: width
    source: Activity.url1 + "tPoint.svg"
    sourceSize.width: width
    sourceSize.height: width
    antialiasing: true

    x: (parent.width - parent.paintedWidth) / 2 + posX * parent.paintedWidth - width / 2
    y: (parent.height - parent.paintedHeight) / 2 + posY * parent.paintedHeight - height / 2

    property double xCenter: terminalPoint.parent.x + terminalPoint.x + width/2
    property double yCenter: terminalPoint.parent.y + terminalPoint.y + height/2
    property double xCenterFromComponent: terminalPoint.x + width/2 - terminalPoint.parent.width / 2
    property double yCenterFromComponent: terminalPoint.y + height/2 - terminalPoint.parent.height / 2

    function updateNetlistIndex(netlistIndex_) {
        terminalPoint.netlistIndex = netlistIndex_;
        parent.externalNetlistIndex[index] = netlistIndex_;
        console.log("polarity is " + terminalType + " , index is " + index + " , netlistIndex is " + netlistIndex_ + " and externalNetlistIndex is " + parent.externalNetlistIndex)
    }

    Rectangle {
        id: boundary
        anchors.centerIn: terminalPoint
        width: terminalPoint.width * 2
        height: width
        visible: selected
        radius: width / 2
        color: "#08D050"
        z: -1
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: {
            selected = true
             Activity.terminalPointSelected(terminalPoint)
        }
    }
}
