import QtQuick 2.0

Item {
    id: nativeTextInput

    property alias fontName: textInput.font.family
    property alias fontPointSize: textInput.font.pointSize
    property alias text: textInput.text
    property alias color: textInput.color
    property alias horizontalAlignment: textInput.horizontalAlignment
    property alias verticalAlignment: textInput.verticalAlignment

    property color iOSTintColor

    TextInput {
        id: textInput
        anchors.fill: parent
    }
}
