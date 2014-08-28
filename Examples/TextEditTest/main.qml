import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Window 2.1

import Qtino.NativeTextInput 1.0

Window {
    visible: true
    width: 360
    height: 360

    Rectangle {
        opacity: 0.2
        color: 'blue'
        anchors.fill: input
        border.color: 'darkblue'
        radius: 10
    }

    NativeTextInput {
        id: input
        height: 50
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter;
        text: "Hello Qml World!"
        verticalAlignment: Text.AlignVCenter;
        horizontalAlignment: Text.AlignHCenter;
        fontName: "Courier New"
        fontPointSize: 20
        iOSTintColor: 'red'
        //Component.onCompleted: { mover.start(); fader.start() }
    }

    TextInput {
        id: qmlInput
        height: input.height
        width: input.width
        anchors.verticalCenter: input.verticalCenter
        text: input.text
        verticalAlignment: input.verticalAlignment
        horizontalAlignment: input.horizontalAlignment
        font.family: "Courier New"
        font.pointSize: input.fontPointSize
        Component.onCompleted: { }
        onTextChanged: {
            var whitespaceRegex = /\s*$/g;
            if (text.match(whitespaceRegex)) {
                space.text = text.match(whitespaceRegex)[0];
                console.log(space.text.length)
            }
            if (horizontalAlignment === Text.AlignHCenter && text.slice(-1) === ' ') {
                x = space.paintedWidth / 2
            }
            else { x = 0 }
        }
        enabled: false
    }

    Text {
        id: space;
        font.family: qmlInput.font.family;
        font.pointSize: qmlInput.font.pointSize;
        text: ' '
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { if (mover.running) mover.stop(); else (mover.resume()) }
    }

    SequentialAnimation {
        id: mover
        PropertyAnimation { target: input; property: 'anchors.verticalCenterOffset'; from: -400; to: 400; duration: 5000 }
        PropertyAnimation { target: input; property: 'anchors.verticalCenterOffset'; from: 400; to: -400; duration: 5000 }
        loops: Animation.Infinite
    }

    SequentialAnimation {
        id: fader
        PropertyAnimation { target: input; property: 'opacity'; from: 1; to: 0; duration: 3000 }
        PropertyAnimation { target: input; property: 'opacity'; from: 0; to: 1; duration: 3000 }
        loops: Animation.Infinite
    }
}
