import QtQuick 2.0
import "."
import FreeVirtualKeyboard 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id:root
    objectName: "inputPanel"
    width: parent.width
    height: parent.height

    property string text: ""

    property var focusedObject: 0

    QtObject {
        id:pimpl
        property int modifier: root.noModifier
        property int verticalSpacing: root.height*3/4 /40
        property int horizontalSpacing: 5
        property int rowHeight: root.height*3/16 - verticalSpacing
        property int buttonWidth: 50
    }

    KeyModel {
        id: keyModel
    }

    function setFocusedObject(object) {
        if (object !== textField) {
            root.focusedObject = object

            if (object) {
                textField.text = object.text
                textField.echoMode = object.echoMode
                numericLayout.visible = object.inputType !== "text"
                numericLayout.dotVisible = object.inputType === "ip"
                keyboardLayout.visible = object.inputType === "text"

                InputEngine.setFocusObject(textField)
            }
        }
    }

    onTextChanged: {
        if (root.focusedObject) {
            root.focusedObject.text = text
        }
    }

    // Report actual keyboard rectangle to input engine
    onYChanged: {
        InputEngine.setKeyboardRectangle(Qt.rect(x, y, width, height))
    }

    // catch all mouse actions
    MouseArea {
        anchors.fill: parent
    }

    Column {
        anchors.fill: parent

        Rectangle {
            width: parent.width
            height: parent.height/4

            TextField {
                id: textField
                anchors.fill: parent
                property string inputType: "text"

                onTextChanged: {
                    root.text = text
                }

                font.pointSize: Math.max(height/4,1)
            }
        }

        Item {
            width: parent.width
            height: parent.height*3/4

            KeyboardLayout {
                id: keyboardLayout
                anchors.fill: parent
                visible: false
            }


            NumericLayout {
                id: numericLayout
                anchors.fill: parent
                visible: false
            }
        }
    }

    KeyPopup {
        id: keyPopup
        visible: false
    }

}
