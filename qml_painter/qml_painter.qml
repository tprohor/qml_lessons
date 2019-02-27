import QtQuick 2.9
import QtQuick.Window 2.3


Window {
    id: window

    visible: true
    width: 640
    height: 480
    minimumWidth: 400
    minimumHeight: 300

    LineCanvas {
        id: lineCanvas
        anchors.fill: parent
        anchors.rightMargin: lineButtons.width + lineButtons.anchors.rightMargin
        anchors.bottomMargin: colorButtons.height + colorButtons.anchors.bottomMargin + 10
    }

    Row {
        id: colorButtons
        height: 30
        spacing: 20

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10

        Switch {
            id: redColorSwitch
            color: "red"
            backgroundColor: "pink"
            dimmedColor: "white"
            borderRadius: colorButtons.height / 2

            onSwitched: parent.setCurrentColor(color, checked)
        }

        Switch {
            id: greenColorSwitch
            color: "green"
            backgroundColor: "lightgreen"
            dimmedColor: "white"
            borderRadius: colorButtons.height / 2

            onSwitched: parent.setCurrentColor(color, checked)
        }

        Switch {
            id: blueColorSwitch
            color: "blue"
            backgroundColor: "lightblue"
            dimmedColor: "white"
            borderRadius: colorButtons.height / 2

            onSwitched: parent.setCurrentColor(color, checked)
        }

        Switch {
            id: yellowColorSwitch
            color: "yellow"
            backgroundColor: "lightyellow"
            dimmedColor: "white"
            borderRadius: colorButtons.height / 2

            onSwitched: parent.setCurrentColor(color, checked)
        }

        Switch {
            id: blackColorSwitch
            color: "black"
            backgroundColor: "lightgrey"
            dimmedColor: "white"
            borderRadius: colorButtons.height / 2

            onSwitched: parent.setCurrentColor(color, checked)
        }

        function setCurrentColor(color, checked) {
            if (!checked) {
                lineCanvas.lineColor = "transparent"
                return;
            }

            redColorSwitch.checked = (color === redColorSwitch.color)
            greenColorSwitch.checked = (color === greenColorSwitch.color)
            blueColorSwitch.checked = (color === blueColorSwitch.color)
            yellowColorSwitch.checked = (color === yellowColorSwitch.color)
            blackColorSwitch.checked = (color === blackColorSwitch.color)
            lineCanvas.lineColor = color
        }
    }

    Column {
        id: lineButtons
        spacing: 0

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10

        property real lineWidth: 1

        Button {
            id: increaseWidthButton

            anchors.horizontalCenter: parent.horizontalCenter

            text: "+"
            textFont.pixelSize: 30
            color: "transparent"
            pressedColor: "transparent"
            textColor: !isPressed ? "dodgerblue" : "blue"
            borderRadius: 10
            padding: 5

            onClicked: lineButtons.increaseWidth()
        }

        Button {
            id: decreaseWidthButton

            anchors.horizontalCenter: parent.horizontalCenter

            text: "-"
            textFont.pixelSize: 30
            color: "transparent"
            pressedColor: "transparent"
            textColor: !isPressed ? "dodgerblue" : "blue"
            borderRadius: 10
            padding: 5

            onClicked: lineButtons.decreaseWidth()
        }

        Button {
            id: removeLinesButton

            anchors.horizontalCenter: parent.horizontalCenter

            text: "x"
            textFont.pixelSize: 30
            color: "transparent"
            pressedColor: "transparent"
            textColor: !isPressed ? "dodgerblue" : "blue"
            borderRadius: 10
            padding: 5

            onClicked: lineButtons.removeLines()
        }

        function increaseWidth() {
            ++lineCanvas.lineWidth
        }

        function decreaseWidth() {
            lineCanvas.lineWidth = lineCanvas.lineWidth - 1 < 1 ? 1 : lineCanvas.lineWidth - 1
        }

        function removeLines() {
            if ("transparent" != lineCanvas.lineColor)
                lineCanvas.removeColor(lineCanvas.lineColor)
        }
    }
}
