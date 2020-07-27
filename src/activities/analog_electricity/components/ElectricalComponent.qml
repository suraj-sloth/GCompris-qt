/* GCompris - ElectricalComponent.qml
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
    id: electricalComponent
    property double posX
    property double posY
    property double imgWidth
    property double imgHeight
    property string imgSrc
    property string information
    property string toolTipTxt
    property int componentIndex
    property int noOfConnectionPoints
//     property int noOfOutputs
    property int rotationAngle: 0
    property int initialAngle: 0
    property int startingAngle: 0
    property double terminalSize
    property bool destructible

    property alias rotateComponent: rotateComponent

    x: posX * parent.width
    y: posY * parent.height
    width: imgWidth * parent.width
    height: imgHeight * parent.height
    fillMode: Image.PreserveAspectFit

    source: Activity.url + imgSrc
    z: 2
    mipmap: true
    antialiasing: true

    onPaintedWidthChanged: {
        updateDragConstraints()
        Activity.updateWires(componentIndex)
    }

    PropertyAnimation {
        id: rotateComponent
        target: electricalComponent
        property: "rotation"
        from: initialAngle; to: initialAngle + rotationAngle
        duration: 1
        onStarted:{ Activity.animationInProgress = true }
        onStopped: {
            initialAngle = initialAngle + rotationAngle
            Activity.updateWires(componentIndex)
            if(initialAngle == startingAngle + rotationAngle * 45) {
                if(initialAngle == 360 || initialAngle == -360)
                    initialAngle = 0
                startingAngle = initialAngle
                Activity.animationInProgress = false
                updateDragConstraints()
            }
            else
                rotateComponent.start()
        }
        easing.type: Easing.InOutQuad
    }

    function updateDragConstraints() {
        if(initialAngle == 0 || initialAngle == 180 || initialAngle == 360 || initialAngle == -360
           || initialAngle == -180) {
            mouseArea.drag.minimumX = (electricalComponent.paintedWidth - electricalComponent.width)/2
            mouseArea.drag.minimumY = (electricalComponent.paintedHeight - electricalComponent.height)/2

            mouseArea.drag.maximumX = electricalComponent.parent.width -
                                      (electricalComponent.width + electricalComponent.paintedWidth)/2
            mouseArea.drag.maximumY = electricalComponent.parent.height -
                                      (electricalComponent.height + electricalComponent.paintedHeight)/2
        }
        else {
            mouseArea.drag.minimumX = (electricalComponent.paintedHeight - electricalComponent.width)/2
            mouseArea.drag.minimumY = (electricalComponent.paintedWidth - electricalComponent.height)/2

            mouseArea.drag.maximumX = electricalComponent.parent.width -
                                      (electricalComponent.width + electricalComponent.paintedHeight)/2
            mouseArea.drag.maximumY = electricalComponent.parent.height -
                                      (electricalComponent.height + electricalComponent.paintedWidth)/2
        }
    }

    MouseArea {
        id: mouseArea
        width: parent.paintedWidth
        height: parent.paintedHeight
        anchors.centerIn: parent
        drag.target: electricalComponent
        onPressed: {
            Activity.updateToolTip(toolTipTxt)
            Activity.componentSelected(componentIndex)
        }
        onClicked: {
            if(Activity.toolDelete || Activity.toolDeleteSticky) {
                if (destructible) {
                    Activity.removeComponent(componentIndex)
                } else {
                    Activity.deselect()
                }
            }
            else {
                if(imgSrc == "switch_off.png") {
                    imgSrc = "switch_on.png"
                    Activity.updateComponent(componentIndex)
                }
                else if(imgSrc == "switch_on.png") {
                    imgSrc = "switch_off.png"
                    Activity.updateComponent(componentIndex)
                }
            }
        }
        onReleased: {
            parent.posX = parent.x / parent.parent.width
            parent.posY = parent.y / parent.parent.height
            Activity.updateToolTip("")
        }

        onPositionChanged: {
            updateDragConstraints()
            Activity.updateWires(componentIndex)
        }
    }
}
