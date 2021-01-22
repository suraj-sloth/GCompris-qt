/* GCompris - Dataset.qml
 *
 * SPDX-FileCopyrightText: 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (Gtk+ version)
 *   Rudra Nil Basu <rudra.nil.basu.1996@gmail.com> (DigitalElectricity)
 *   Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com> (AnalogElectricity activity)
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
            introMessage: [
                qsTr("A bulb glows when current travel through it. If there is a gap in the path, the current cannot travel and the electrical devices will not work."),
                qsTr("The travelling path is called circuit. Electrical devices can work only in a closed circuit. Wires can be used to connect devices and create the circuit."),
                qsTr("For a detailed description of battery and bulb, click on those and then clik on the info button."),
                qsTr("Turn on the bulb using the provided battery. To connect two terminals, cilck on a terminal, then on a second terminal")
            ]
        },
        // level 2
        {
            inputComponentList: [battery],
            playAreaComponentList: [bulb, connection],
            determiningComponentsIndex: [0, 1],
            wires: [ [0, 1, 1, 0] ],
            playAreaComponentPositionX: [0.2, 0.4],
            playAreaComponentPositionY: [0.35, 0.25],
            introMessage: [
                qsTr("A connector can be used to connect several wires in a circuit."),
                qsTr("Light the bulb so that the current should flow through the provided simple connector.")
            ]
        },
        // level 3
        {
            inputComponentList: [battery, bulb, rheostat, resistor, switch1, connection, redLed]
        }
    ]
}
