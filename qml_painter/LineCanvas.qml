import QtQuick 2.6

Item {
    id: root

    property var lines: []

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = canvas.getContext("2d");
            ctx.clearRect(0, 0, width, height);

            for (var i = 0; i < lines.length; ++i) {
                ctx.strokeStyle = lines[i].color
                ctx.lineWidth = lines[i].width

                ctx.beginPath()
                ctx.moveTo(lines[i].points[0].x, lines[i].points[0].y)
                ctx.lineTo(lines[i].points[1].x, lines[i].points[1].y)
                ctx.stroke()
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        property real cursorX
        property real cursorY
        property bool isPressed

        onPressed: {
            isPressed = true
            addLine(Qt.rgba(Math.random(), Math.random(), Math.random(), 1),
                1 + Math.random() * 4, [{ x: mouseX, y: mouseY }, { x: mouseX, y: mouseY }])
            canvas.requestPaint()
        }
        onPositionChanged: {
            if (!isPressed)
                return

            lines[lines.length - 1].points[1].x = mouseX;
            lines[lines.length - 1].points[1].y = mouseY;
            canvas.requestPaint();
        }
        onReleased: {
            isPressed = false
        }
    }

    //Component.onCompleted: canvas.getContext("2d")

    function addLine(color, width, points) {
        var line = JSON.parse('{ "color": "' + color + '", "width": ' + width + ', "points": [ {"x": ' + points[0].x +', "y": ' + points[0].y + '}, {"x": ' + points[1].x +', "y": ' + points[1].y + '} ] }');
        lines.push(line)
    }

    function removeColor(color) {
        console.log("removeLines " + color)
        lines = lines.filter(function (line) { if (line.color === color) { return false; } return true; })
    }
}
