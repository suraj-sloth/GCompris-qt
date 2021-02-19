/* GCompris
 *
 * Copyright (C) 2015 Bruno Coudoin <bruno.coudoin@gcompris.net>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Pulkit Gupta <pulkitgenius@gmail.com> (Qt Quick port)
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
   property string instruction: qsTr("Drag and Drop the items to match them.")

   property var levels: [
      {
          "pixmapfile" : "food/baby_bottle.svg",
          "x" : "0.5",
          "y" : "0.25"
      },
      {
          "pixmapfile" : "food/orange.svg",
          "x" : "0.2",
          "y" : "0.75"
      },
      {
          "pixmapfile" : "food/cookie.svg",
          "x" : "0.8",
          "y" : "0.75"
      },
      {
          "pixmapfile" : "food/chocolate.svg",
          "x" : "0.5",
          "y" : "0.75"
      },
      {
          "pixmapfile" : "food/marmelade.svg",
          "x" : "0.8",
          "y" : "0.25"
      },
      {
          "pixmapfile" : "food/butter.svg",
          "x" : "0.2",
          "y" : "0.25"
      },
      {
          "pixmapfile" : "shapeBackground/T_butter.svg",
          "x" : "0.2",
          "y" : "0.25",
          "type" : "SHAPE_BACKGROUND"
      },
      {
          "pixmapfile" : "shapeBackground/T_baby_bottle.svg",
          "x" : "0.5",
          "y" : "0.25",
          "type" : "SHAPE_BACKGROUND"
      },
      {
          "pixmapfile" : "shapeBackground/T_marmelade.svg",
          "x" : "0.8",
          "y" : "0.25",
          "type" : "SHAPE_BACKGROUND"
      },
      {
          "pixmapfile" : "shapeBackground/T_orange.svg",
          "x" : "0.2",
          "y" : "0.75",
          "type" : "SHAPE_BACKGROUND"
      },
      {
          "pixmapfile" : "shapeBackground/T_chocolate.svg",
          "x" : "0.5",
          "y" : "0.75",
          "type" : "SHAPE_BACKGROUND"
      },
      {
          "pixmapfile" : "shapeBackground/T_cookie.svg",
          "x" : "0.8",
          "y" : "0.75",
          "type" : "SHAPE_BACKGROUND"
      }
   ]
}
