/* GCompris - AdvancedTimer.qml
 *
 * Copyright (C) 2018 Aman Kumar Gupta <gupta2140@gmail.com>
 *
 * Authors:
 *   Beth Hadley <bethmhadley@gmail.com> (GTK+ version)
 *   Johnny Jazeix <jazeix@gmail.com> (Qt Quick port)
 *   Aman Kumar Gupta <gupta2140@gmail.com> (Qt Quick port)
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
 *   along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.1
import QtQuick.Controls 1.0
import GCompris 1.0
import "note_names.js" as Activity

Timer {
    id: timer

    property double startTime
    property double pauseTime
    property int timerNormalInterval: 2700
    property int remainingInterval

    interval: timerNormalInterval

    signal pause
    signal resume

    onPause: {
        console.log(interval)
        if(timer.running) {
            pauseTime = new Date().getTime()
            timer.stop()
        }
    }

    onResume: {
        if(!timer.running) {
            if(!triggeredOnStart) {
                remainingInterval = Math.abs(timer.interval - Math.abs(pauseTime - startTime))
                timer.interval = remainingInterval
            }
            timer.start()
        }
    }

    onTriggered:{
        if(interval != timerNormalInterval) {
            interval = timerNormalInterval
        }
    }

    onRunningChanged: {
        if(running)
            startTime = new Date().getTime()
    }
}
