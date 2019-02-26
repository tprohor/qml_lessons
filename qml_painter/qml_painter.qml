import QtQuick 2.9
import QtQuick.Window 2.3


Window {
    visible: true
    width: 640
    height: 480

    LineCanvas {
        id: lineCanvas
        anchors.fill: parent
    }

    /*Button {
        anchors.centerIn: parent
        text: qsTr("Click me")
        textFont.pixelSize: 48
        color: "red"
        pressedColor: "blue"
        padding: 40
        textColor: isPressed ? "green" : "pink"
        borderRadius: 20
    }*/

    /*Switch {
        anchors.centerIn: parent
        color: "red"
        backgroundColor: "green"
        dimmedColor: "grey"
    }*/
}
