/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <https://www.gnu.org/licenses/>.
 */
import GCompris 1.0

ActivityInfo {
  name: "analog_electricity/AnalogElectricity.qml"
  difficulty: 6
  icon: "analog_electricity/analog_electricity.svg"
  author: "Aiswarya Kaitheri Kandoth &lt;aiswaryakk29@gmail.com&gt;"
  //: Activity title
  title: qsTr("Analog Electricity")
  //: Help title
  description: qsTr("Create and simulate an analog electric schema")
  //intro: "put here in comment the text for the intro voice"
  //: Help goal
  goal: qsTr("Freely create an analog electric schema with a real time simulation.")
  //: Help prerequisite
  prerequisite: qsTr("Requires some basic understanding of the concept of analog electronics.")
  //: Help manual
  manual: qsTr("Drag electrical components from the selector and drop them in the working area. In the working area, you can move the components by dragging them. To delete a component, select the deletion tool on top of the component selector, and select the component. You can click on the component and then on the rotate button to rotate it or info button to get information about it. You can click on the switch to open and close it. To connect two terminals, click on first terminal, then on second terminal. To deselect terminal or delete tool, click on any empty area. The simulation is updated in real time by any user action.")
  credit: "Engine is from EdX"
  section: "sciences experiment"
  createdInVersion: 9800
}
