/* GCompris - Dataset.qml
 *
 * SPDX-FileCopyrightText: 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (Gtk+ version)
 *   Rudra Nil Basu <rudra.nil.basu.1996@gmail.com> (DigitalElectricity)
 *   Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com> (AnalogElectricity)
 *
 *   SPDX-License-Identifier: GPL-3.0-or-later
 */
import QtQuick 2.6

QtObject {
    property var battery: {
        'imageName': 'battery.svg',
        'componentSource': 'Battery.qml',
        'width': 0.06,
        'height': 0.15,
        'toolTipText': qsTr("Battery"),
        'type': "v"
    }

    property var bulb: {
        'imageName': 'bulb.svg',
        'componentSource': 'Bulb.qml',
        'width': 0.15,
        'height': 0.15,
        'toolTipText': qsTr("Bulb"),
        'type': "r"
    }

    property var switch1: {
        'imageName': 'switch_off.svg',
        'componentSource': 'Switch1.qml',
        'width': 0.15,
        'height': 0.06,
        'toolTipText': qsTr("Switch"),
        'type': "r"
    }

    property var switch2: {
        'imageName': 'switch2_off.svg',
        'componentSource': 'Switch2.qml',
        'width': 0.15,
        'height': 0.09,
        'toolTipText': qsTr("3 points switch"),
        'type': "r"
    }

    property var connection: {
        'imageName': 'connection_icon.svg',
        'componentSource': 'Connection.qml',
        'width': 0.15,
        'height': 0.06,
        'toolTipText': qsTr("Simple connector")
    }

    property var rheostat: {
        'imageName': 'rheostat_icon.svg',
        'componentSource': 'Rheostat.qml',
        'width': 0.09,
        'height': 0.15,
        'toolTipText': qsTr("Rheostat"),
        'type': "r"
    }

    property var resistor: {
        'imageName': 'resistor.svg',
        'componentSource': 'Resistor.qml',
        'width': 0.15,
        'height': 0.06,
        'toolTipText': qsTr("Resistor"),
        'type': "r"
    }

    property var redLed: {
        'imageName': 'red_led_off.svg',
        'componentSource': 'RedLed.qml',
        'width': 0.15,
        'height': 0.09,
        'toolTipText': qsTr("Red LED"),
        'type': "d"
    }

    // List of all components
    property var componentList: [battery, bulb, switch1, switch2, connection, rheostat, resistor, redLed]

    property var problemType: {
        'lightTheBulb' : 1,
        'others' : 2
    }

    // tutorial levels
    property var tutorialLevels: [
        // level 1
        {
            inputComponentList: [],
            playAreaComponentList: [bulb, battery],
            determiningComponentsIndex: [0],
            wires: [ [0, 1, 1, 0] ], // from component_index, from terminalNumber, to component_index, to terminalNumber
            playAreaComponentPositionX: [0.4, 0.6],
            playAreaComponentPositionY: [0.1, 0.3],
            type: problemType.lightTheBulb,
            introMessage: [
                qsTr("A bulb glows when current travels through it. If there is a gap in the path, the current cannot travel and the electrical devices will not work."),
                qsTr("The travelling path is called circuit. Electrical devices can work only in a closed circuit. Wires can be used to connect devices and create the circuit."),
                qsTr("For a detailed description of battery and bulb, click on those and then click on the info button."),
                qsTr("Turn on the bulb using the provided battery. To connect two terminals, cilck on a terminal, then on a second terminal.")
            ]
        },
        // level 2
        {
            inputComponentList: [battery],
            playAreaComponentList: [bulb],
            determiningComponentsIndex: [0],
            wires: [],
            playAreaComponentPositionX: [0.4],
            playAreaComponentPositionY: [0.3],
            type: problemType.lightTheBulb,
            introMessage: [
                qsTr("Light the bulb using the provided battery.")
            ]
        },
        // level 3
        {
            inputComponentList: [battery],
            playAreaComponentList: [bulb, switch1],
            determiningComponentsIndex: [0, 1],
            wires: [],
            playAreaComponentPositionX: [0.4, 0.7],
            playAreaComponentPositionY: [0.35, 0.3],
            type: problemType.others,
            introMessage: [
                qsTr("Switch can connect or disconnect the current travelling path also called conducting path in a circuit."),
                qsTr("You can click on the switch to open and close it."),
                qsTr("Create a circuit using the provided components so that the bulb glows only when the switch is on.")
            ]
        },
        // level 4
        {
            inputComponentList: [battery, switch1, connection],
            playAreaComponentList: [bulb, switch1, bulb],
            determiningComponentsIndex: [0, 1, 2],
            wires: [],
            playAreaComponentPositionX: [0.4, 0.7, 0.4],
            playAreaComponentPositionY: [0.35, 0.3, 0.05],
            type: problemType.others,
            introMessage: [
                qsTr("Simple connector can be used to connect several wires in an electrical circuit."),
                qsTr("Create a circuit so that one bulb should be always lit and the other should be lit only when the switch is on.")
            ]
        }
    ]
}
