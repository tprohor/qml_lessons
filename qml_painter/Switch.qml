import QtQuick 2.0

Item {
    id: root

    property alias color: switchRectangle.color
    property color backgroundColor: color
    property color dimmedColor: color
    property real borderRadius: 10
    property bool checked: false
    property int duration: 100

    width: 4 * root.borderRadius
    height: 2 * root.borderRadius

    signal switched()

    MouseArea {
        id: mouseArea

        property bool isChecked: false

        anchors.fill: parent
        onClicked:{
            root.checked = !root.checked
            root.switched()
        }
    }

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        radius: root.borderRadius
        border.color: "darkgrey"
        border.width: 1
        color: root.checked ? root.backgroundColor : root.dimmedColor

        Behavior on color {
            PropertyAnimation { duration: root.duration }
        }
    }

    Rectangle {
        id: switchRectangle
        x: !root.checked ? 0 : root.width - root.borderRadius * 2
        y: 0

        width: 2 * root.borderRadius
        height: 2 * root.borderRadius
        radius: root.borderRadius
        border.color: "darkslategrey"
        border.width: 1

        Behavior on x {
            PropertyAnimation { duration: root.duration }
        }
    }
}
