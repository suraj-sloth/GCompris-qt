/* GCompris - Dataset.qml
 *
 * Copyright (C) 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (Gtk+ version)
 *   Rudra Nil Basu <rudra.nil.basu.1996@gmail.com> (DigitalElectricity)
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

QtObject {
    property var battery: {
        'imageName': 'battery.png',
        'componentSource': 'Battery.qml',
        'width': 0.2,
        'height': 0.2,
        'toolTipText': qsTr("Battery"),
        'type': qsTr("v")
    }

    property var bulb: {
        'imageName': 'bulb1.png',
        'componentSource': 'Bulb.qml',
        'width': 0.2,
        'height': 0.2,
        'toolTipText': qsTr("Bulb"),
        'type': qsTr("r")
    }
    // List of all components
    property var componentList: [battery, bulb]

//     property var problemType: {
//         'lightTheBulb': 1,
//         'equation1Variable': 2,
//         'equation2Variables': 3,
//         'equation3Variables': 4,
//         'others': 5,
//     }
    // tutorial levels
    property var tutorialLevels: [
        // level 1
        {
            inputComponentList: [battery],
            playAreaComponentList: [bulb],
            determiningComponentsIndex: [0],
            wires: [],
            playAreaComponentPositionX: [0.4],
            playAreaComponentPositionY: [0.3],
//             type: [problemType.lightTheBulb],
            introMessage: [
                qsTr("The digital light will glow when its terminal is connected with an input of 1."),
                qsTr("Turn the digital light on using the inputs provided.")
            ]
        },
        // level 2
        {
            inputComponentList: [battery],
            playAreaComponentList: [bulb],
            determiningComponentsIndex: [0],
            //wires: [],
            playAreaComponentPositionX: [0.4],
            playAreaComponentPositionY: [0.3],
//             type: [problemType.lightTheBulb],
            introMessage: [
                qsTr("The digital light will glow when its terminal is connected with an input of 1."),
                qsTr("Turn the digital light on using the inputs provided.")
            ]
        }
    ]
}
