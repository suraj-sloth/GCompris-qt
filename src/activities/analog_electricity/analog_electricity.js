/* GCompris - analog_electricity.js
 *
 * Copyright (C) 2020 Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin (GTK+ version)
 *   Aiswarya Kaitheri Kandoth <aiswaryakk29@gmail.com> (Qt Quick port)
 *   Timothée Giet <animtim@gmail.com> (Help for the Qt Quick port)
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
.pragma library
.import QtQuick 2.6 as Quick
.import "cktsim.js" as Engine

var url = "qrc:/gcompris/src/activities/analog_electricity/resource/";
var url1 = "qrc:/gcompris/src/activities/digital_electricity/resource/";

var currentLevel = 0;
var numberOfLevel = 4;
var items;
var toolDelete;
var toolDeleteSticky;
var animationInProgress;
var selectedIndex;
var selectedTerminal;
var components = [];
var connectionCount = 0;

var netlistComponents = [];
var vSourcesList = [];
var netlist = [];
// var ground =[
//     "g",
//     [
//     ],
//     {
//         "_json_": 0
//     },
//     [
//         "0"
//     ]
// ];

var currentZoom;
var maxZoom = 0.375;
var minZoom = 0.125;
var defaultZoom = 0.25;
var zoomStep = 0.0625;

var direction = {
    LEFT: -1,
    RIGHT: 1,
    UP: -2,
    DOWN: 2
};

var viewPort = {
    leftExtreme: 0,
    rightExtreme: 1,
    topExtreme: 0,
    bottomExtreme: 1,
    leftEdge: 0,
    topEdge: 0
};

function start(items_) {
    items = items_;
    currentLevel = 1;
    numberOfLevel = items.tutorialDataset.tutorialLevels.length;
    initLevel();
    connectionCount = 0;
    netlistComponents = [];
    netlist = [];
}

function stop() {
    for(var i = 0 ; i < components.length ; ++i) {
        removeComponent(i);
    }
}

function initLevel() {
    items.bar.level = currentLevel;

    items.availablePieces.view.currentDisplayedGroup = 0;
    items.availablePieces.view.previousNavigation = 1;
    items.availablePieces.view.nextNavigation = 1;
    components = [];
    animationInProgress = false;
    toolDelete = false;
    toolDeleteSticky = false;
    deselect();

    currentZoom = defaultZoom;
    viewPort.leftEdge = 0;
    viewPort.topEdge = 0;
    items.playArea.x = items.mousePan.drag.maximumX;
    items.playArea.y = items.mousePan.drag.maximumY;

    loadFreeMode();

//     var levelProperties = items.tutorialDataset.tutorialLevels[currentLevel - 1]
// 
//     for (var i = 0; i < levelProperties.inputComponentList.length; i++) {
//         var currentInputComponent = levelProperties.inputComponentList[i]
//         items.availablePieces.model.append( {
//             "imgName": currentInputComponent.imageName,
//             "componentSrc": currentInputComponent.componentSource,
//             "imgWidth": currentInputComponent.width,
//             "imgHeight": currentInputComponent.height,
//             "toolTipText": currentInputComponent.toolTipText
//         })
//     }
// 
//     for (var i = 0; i < levelProperties.playAreaComponentList.length; i++) {
//         var index = components.length
//         var currentPlayAreaComponent = levelProperties.playAreaComponentList[i];
//         var staticElectricalComponent = Qt.createComponent("qrc:/gcompris/src/activities/analog_electricity/components/" + currentPlayAreaComponent.componentSource)
//         components[index] = staticElectricalComponent.createObject(
//             items.playArea, {
//                 "index": index,
//                 "posX": levelProperties.playAreaComponentPositionX[i] * currentZoom,
//                 "posY": levelProperties.playAreaComponentPositionY[i] * currentZoom,
//                 "imgSrc": currentPlayAreaComponent.imageName,
//                 "toolTipTxt": currentPlayAreaComponent.toolTipText,
//                 "imgWidth": currentPlayAreaComponent.width * currentZoom,
//                 "imgHeight": currentPlayAreaComponent.height * currentZoom,
//                 "destructible": false
//             });
//         console.log("component is " + components[index]);
//     }
// 
//         var _determiningComponentsIndex = levelProperties.determiningComponentsIndex
//         for (var i = 0; i < _determiningComponentsIndex.length; i++) {
//             determiningComponents[determiningComponents.length] = components[_determiningComponentsIndex[i]]
//             console.log("component index i is " + i);
//         }
// 
//         creating wires
//         for (i = 0; i < levelProperties.wires.length; i++) {
//             var terminal_number = levelProperties.wires[i][1]
//             console.log("terminal_number is " + terminal_number);
//             var connectionPoint = components[levelProperties.wires[i][0]].connectionPoints.itemAt(terminal_number)
//             console.log("connection point is " + connectionPoint);

////             terminal_number = levelProperties.wires[i][3]
////             console.log("terminal_number for nodeX is " + terminal_number);
////             var nodeX = components[levelProperties.wires[i][2]].nodeXs.itemAt(terminal_number)

//             createWire(connectionPoint, false)
//         }
}

function loadFreeMode() {
    var componentList = items.tutorialDataset.componentList;
    for (var i = 0; i < componentList.length; i++) {
        items.availablePieces.model.append( {
            "imgName": componentList[i].imageName,
            "componentSrc": componentList[i].componentSource,
            "imgWidth": componentList[i].width,
            "imgHeight": componentList[i].height,
            "toolTipText": componentList[i].toolTipText,
        });
    }
}

function zoomIn() {
    var previousZoom = currentZoom;
    currentZoom += zoomStep;
    if (currentZoom > maxZoom)
        currentZoom = maxZoom;
    var zoomRatio = currentZoom / previousZoom;
    updateComponentDimension(zoomRatio);

    if (currentZoom == maxZoom) {
        items.availablePieces.zoomInBtn.state = "cannotZoomIn";
    } else {
        items.availablePieces.zoomInBtn.state = "canZoomIn";
    }
    items.availablePieces.zoomOutBtn.state = "canZoomOut";

    if (items.zoomLvl < 0.5) {
        items.zoomLvl += 0.125;
    }
}

function zoomOut() {
    var previousZoom = currentZoom;
    currentZoom -= zoomStep;
    if (currentZoom < minZoom)
        currentZoom = minZoom;
    var zoomRatio = currentZoom / previousZoom;
    updateComponentDimension(zoomRatio);

    if (currentZoom == minZoom) {
        items.availablePieces.zoomOutBtn.state = "cannotZoomOut";
    } else {
        items.availablePieces.zoomOutBtn.state = "canZoomOut";
    }
    items.availablePieces.zoomInBtn.state = "canZoomIn";

    if (items.zoomLvl > 0) {
        items.zoomLvl -= 0.125;
    }
}

function updateComponentDimension(zoomRatio) {
    for (var i = 0; i < components.length; i++) {
        components[i].posX *= zoomRatio;
        components[i].posY *= zoomRatio;
        components[i].imgWidth *= zoomRatio;
        components[i].imgHeight *= zoomRatio;
        updateWires(i);
    }
}

function nextLevel() {
//     if(numberOfLevel <= ++currentLevel) {
//         currentLevel = 1
//     }
//     initLevel();
}

function previousLevel() {
//     if(--currentLevel < 1) {
//         currentLevel = numberOfLevel - 1
//     }
//     initLevel();
}

function createComponent(x, y, componentIndex) {
    x = x / items.playArea.width;
    y = y / items.playArea.height;

    var index = components.length;

    var component = items.availablePieces.repeater.itemAt(componentIndex);
    var electricComponent = Qt.createComponent("qrc:/gcompris/src/activities/analog_electricity/components/" +
                                               component.source);

    components[index] = electricComponent.createObject(
                        items.playArea, {
                            "componentIndex": index,
                            "posX": x,
                            "posY": y,
                            "imgSrc": component.imageName,
                            "imgWidth": component.imageWidth * currentZoom,
                            "imgHeight": component.imageHeight * currentZoom,
                            "destructible": true
                        });
    components[index].componentName = components[index].componentName + index.toString();
    components[index].initConnections();
    toolDeleteSticky = false;
    deselect();
}

/* Creates wire between two points.
*/
function terminalPointSelected(terminal) {
    if(selectedTerminal == -1 || selectedTerminal == terminal)
        selectedTerminal = terminal;
    else if(selectedTerminal.parent != terminal.parent) {
        var connectionPoint = terminal;
        createWire(connectionPoint, true);
        deselect();
    }
    else {
        deselect();
        selectedTerminal = terminal;
        terminal.selected = true;
    }
}

function createWire(connectionPoint, destructible) {
    var wireComponent = Qt.createComponent("qrc:/gcompris/src/activities/analog_electricity/Wire.qml");
    var wire = wireComponent.createObject(
               items.playArea, {
                    "node1": selectedTerminal,
                    "node2": connectionPoint,
                    "destructible": destructible,
                });
    if(connectionPoint.wires.length === 0 && selectedTerminal.wires.length === 0) {
        connectionPoint.updateNetlistIndex(selectedTerminal.netlistIndex);
        selectedTerminal.updateNetlistIndex(selectedTerminal.netlistIndex);
    } else if(connectionPoint.wires.length > 0) {
        connectionPoint.updateNetlistIndex(connectionPoint.netlistIndex);
    } else if(selectedTerminal.wires.length > 0) {
        selectedTerminal.updateNetlistIndex(selectedTerminal.netlistIndex);
    }
    connectionPoint.wires.push(wire);
    selectedTerminal.wires.push(wire);
    updateWires(connectionPoint.parent.componentIndex);
    updateWires(selectedTerminal.parent.componentIndex);
    connectionPoint.parent.checkConnections();
    selectedTerminal.parent.checkConnections();
    createNetlist();
}

function updateWires(index) {
    var component = components[index];
    if(component == undefined || component.noOfConnectionPoints == undefined)
        return;

    var rotatedAngle = component.initialAngle * Math.PI / 180;
    for(var i = 0 ; i < component.noOfConnectionPoints ; ++i) {
        var terminal = component.connectionPoints.itemAt(i);
        for(var j = 0 ; j < terminal.wires.length ; ++j) {
            var wire = terminal.wires[j];
            if(wire.node1 != terminal) {
                var otherAngle = wire.node1.parent.initialAngle * Math.PI / 180;
                var x = wire.node1.xCenterFromComponent;
                var y = wire.node1.yCenterFromComponent;
                var x1 = wire.node1.xCenter - x + x * Math.cos(otherAngle) - y * Math.sin(otherAngle);
                var y1 = wire.node1.yCenter - y + x * Math.sin(otherAngle) + y * Math.cos(otherAngle);

                x = terminal.xCenterFromComponent;
                y = terminal.yCenterFromComponent;
                var x2 = terminal.xCenter - x + x * Math.cos(rotatedAngle) - y * Math.sin(rotatedAngle);
                var y2 = terminal.yCenter - y + x * Math.sin(rotatedAngle) + y * Math.cos(rotatedAngle);

                var width = Math.pow((Math.pow(x1 - x2, 2) +  Math.pow(y1 - y2, 2)),0.5) + 2;
                var angle = (180/Math.PI)*Math.atan((y2-y1)/(x2-x1));
                if(x2 - x1 < 0)
                    angle = angle - 180;
                wire.x = x1;
                wire.y = y1 - wire.height / 2;
                wire.width = width;
                wire.rotation = angle;
            }
        }
    }
    for(var i = 0 ; i < component.noOfConnectionPoints ; ++i) {
        var terminal = component.connectionPoints.itemAt(i);
        for(var j = 0 ; j < terminal.wires.length ; ++j) {
            var x = terminal.xCenterFromComponent;
            var y = terminal.yCenterFromComponent;
            var x1 = terminal.xCenter - x + x * Math.cos(rotatedAngle) - y * Math.sin(rotatedAngle);
            var y1 = terminal.yCenter - y + x * Math.sin(rotatedAngle) + y * Math.cos(rotatedAngle);

            var wire = terminal.wires[j];
            if(wire.node2 != terminal) {
                var otherAngle = wire.node2.parent.initialAngle * Math.PI / 180;
                x = wire.node2.xCenterFromComponent;
                y = wire.node2.yCenterFromComponent;
                var x2 = wire.node2.xCenter - x + x * Math.cos(otherAngle) - y * Math.sin(otherAngle);
                var y2 = wire.node2.yCenter - y + x * Math.sin(otherAngle) + y * Math.cos(otherAngle);

                var width = Math.pow((Math.pow(x1 - x2, 2) +  Math.pow(y1 - y2, 2)),0.5) + 2;
                var angle = (180/Math.PI)*Math.atan((y2-y1)/(x2-x1));
                if(x2 - x1 < 0)
                    angle = angle - 180;
                wire.x = x1;
                wire.y = y1;
                wire.width = width;
                wire.rotation = angle;
            }
        }
    }
}

function deselect() {
    if(toolDeleteSticky == false) {
        toolDelete = false;
        items.availablePieces.toolDelete.state = "notSelected";
    }
    items.availablePieces.rotateLeft.state = "canNotBeSelected";
    items.availablePieces.rotateRight.state = "canNotBeSelected";
    items.availablePieces.info.state = "canNotBeSelected";
//     items.infoTxt.visible = false
    selectedIndex = -1;
    selectedTerminal = -1;
    for(var i = 0 ; i < components.length ; ++i) {
        var component = components[i];
        for(var j = 0 ; j < component.noOfConnectionPoints ; ++j)
            component.connectionPoints.itemAt(j).selected = false;
    }
}

function removeComponent(index) {
    var component = components[index];
    for(var i = 0 ; i < component.noOfConnectionPoints ; ++i) {
        var terminal = component.connectionPoints.itemAt(i);
        if(terminal.wires.length != 0)
            for(var j = 0; j < terminal.wires.length; ++j) {
                removeWire(terminal.wires[j]);
            };
    }
    components[index].destroy();
    components.splice(index, 1);
    deselect();
}

function removeWire(wire) {
    var connectionPoint1 = wire.node1;
    var connectionPoint2 = wire.node2;

    var removeIndex = connectionPoint1.wires.indexOf(wire);
    connectionPoint1.wires.splice(removeIndex, 1);
    removeIndex = connectionPoint2.wires.indexOf(wire);
    connectionPoint2.wires.splice(removeIndex, 1);

    wire.destroy();
    deselect();
    connectionPoint1.resetIndex();
    connectionPoint2.resetIndex();
    connectionPoint1.parent.checkConnections();
    connectionPoint2.parent.checkConnections();
    createNetlist();
}

function componentSelected(index) {
    selectedIndex = index;
    items.availablePieces.rotateLeft.state = "canBeSelected";
    items.availablePieces.rotateRight.state = "canBeSelected";
    items.availablePieces.info.state = "canBeSelected";
}

function rotateLeft() {
    components[selectedIndex].rotationAngle = -2;
    components[selectedIndex].rotateComponent.start();
}

function rotateRight() {
    components[selectedIndex].rotationAngle = 2;
    components[selectedIndex].rotateComponent.start();
}

function displayInfo() {
    var component = components[selectedIndex];
    deselect();
    items.infoTxt.visible = true;
    items.infoTxt.text = component.information;

    if(component.infoImageSrc != undefined) {
        items.infoImage.imgVisible = true;
        items.infoImage.source = url + component.infoImageSrc;
    }
    else {
        items.infoImage.imgVisible = false;
        items.infoImage.source = "";
    }
}

function updateToolTip(toolTipText) {
    items.toolTip.show(toolTipText);
}

function createNetlist() {
    netlist.length = 0;
    netlistComponents.length = 0;
    vSourcesList.length = 0;
    for(var i = 0; i < components.length; i++) {
        var component = components[i];
        component.addToNetlist();
    }
    dcAnalysis();
}

function dcAnalysis() {
    var ckt = new Engine.cktsim.Circuit();
    ckt.load_netlist(netlist);

    var voltageResults = ckt.dc();
    console.log("dc analysis is " + ckt.dc());
    for(var i in netlistComponents) {
        if(netlistComponents[i].nodeVoltages == undefined) {
            continue;
        } else {
            for(var j = 0 ; j < netlistComponents[i].nodeVoltages.length ; j++) {
                if(netlistComponents[i].internalNetlistIndex != null) {
                    netlistComponents[i].nodeVoltages[j] = voltageResults[netlistComponents[i].internalNetlistIndex[j]];
                } else {
                    netlistComponents[i].nodeVoltages[j] = voltageResults[netlistComponents[i].externalNetlistIndex[j]];
                }
            }
            netlistComponents[i].updateValues();
            console.log("component " + netlistComponents[i].componentName + " voltages are " + netlistComponents[i].nodeVoltages);
        }
    }

    var currentResults = ckt.GCCurrentResults;
    for(var i in currentResults) {
        vSourcesList[i].current = currentResults[i];
    }
}
