import QtQuick 2.0
import "."
import FreeVirtualKeyboard 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: root
    property bool dotVisible: false

    function showKeyPopup(keyButton) {
        keyPopup.popup(keyButton, root)
    }

    function updateKeyPopupMousePosition(mouseX, mouseY) {
        keyPopup.updateMousePosition(mouseX, mouseY)
    }

    Rectangle {
        id:keyboard
        color: "black"
        anchors.fill: parent

        GridLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height
            width: height

            columns: 4
            rows: 4

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "7"
                inputPanel: root
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "8"
                inputPanel: root
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "9"
                inputPanel: root
            }

            KeyButton {
                id: backspaceKey
                Layout.fillHeight: true
                Layout.fillWidth: true

                inputPanel: root
                text: "\x7F"

                imageSource: "qrc:/images/backspace.svg"
                imageScale: 0.5
                repeat: true
                showPreview: false
            }

            //////////////////////////////////

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "4"
                inputPanel: root
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "5"
                inputPanel: root
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "6"
                inputPanel: root
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            //////////////////////////////////

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "1"
                inputPanel: root
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "2"
                inputPanel: root
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "3"
                inputPanel: root
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            //////////////////////////////////


            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "0"
                inputPanel: root

            }

            KeyButton {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: "."
                inputPanel: root
                visible: root.dotVisible
            }

            KeyButton {
                id: returnKey

                Layout.fillHeight: true
                Layout.fillWidth: true

                text: ""
                imageSource: "qrc:/images/keyboard_return.svg"
                imageScale: 0.5

                inputPanel: root
                showPreview: false
                onClicked: {
                    Qt.inputMethod.hide()
                }

                Layout.columnSpan: root.dotVisible ? 1 : 2
            }
        }
    }
}
