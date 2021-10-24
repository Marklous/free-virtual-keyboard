import QtQuick 2.0
import "."
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: root


    // !! can not be implemented as enum because of Qt 5.9.7 and its javascript support !!
    property int noModifier: 0
    property int shiftModifier: 1
    property int symbolModifier: 2
    property int symbolModifier2: 3

    property string currentLanguage: "en"
    property string currentLanguageShortcut: "English"

    onVisibleChanged: {
        pimpl.modifier = root.noModifier
    }

    function showKeyPopup(keyButton) {
        keyPopup.popup(keyButton, root)
    }

    function updateKeyPopupMousePosition(mouseX, mouseY) {
        keyPopup.updateMousePosition(mouseX, mouseY)
    }

    Component {
        id: keyButtonDelegate
        KeyButton {
            id: button
            Layout.preferredWidth:  pimpl.buttonWidth
            Layout.fillHeight: true
            text: {
                switch(pimpl.modifier) {
                case root.noModifier:
                    return letter
                case root.shiftModifier:
                    return letter.toUpperCase()
                case root.symbolModifier:
                    return firstSymbol
                case root.symbolModifier2:
                    return secondSymbol
                }

                return ""
            }

            alternatives: {
                switch(pimpl.modifier) {
                case root.noModifier:
                    return alternativeLetters
                case root.shiftModifier:
                    return alternativeLetters.toUpperCase()
                case root.symbolModifier2:
                    return secondAlternativeSymbols
                }

                return ""
            }

            visible: text !== ""
            inputPanel: root
        }
    }

    Component {
        id: topKeyButtonDelegate
        KeyButton {
            id: button
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: {
                switch(pimpl.modifier) {
                case root.noModifier:
                    return letter
                case root.shiftModifier:
                    return letter.toUpperCase()
                case root.symbolModifier:
                    return firstSymbol
                case root.symbolModifier2:
                    return secondSymbol
                }

                return ""
            }

            alternatives: {
                switch(pimpl.modifier) {
                case root.noModifier:
                    return alternativeLetters
                case root.shiftModifier:
                    return alternativeLetters.toUpperCase()
                case root.symbolModifier2:
                    return secondAlternativeSymbols
                }

                return ""
            }

            visible: text !== ""
            inputPanel: root

            onWidthChanged: {
                pimpl.buttonWidth = width
            }
        }
    }


    Rectangle {
        id:keyboard
        color: "black"
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
        }

        Column {
            id:column
            anchors.margins: 5
            anchors.fill: parent
            spacing: 5

            // 1
            RowLayout {
                width: parent.width
                height: pimpl.rowHeight

                Repeater {
                    model: keyModel.firstRowModel
                    delegate: topKeyButtonDelegate
                }

                KeyButton {
                    id: backspaceKey
                    color: "#1e1b18"
                    Layout.preferredWidth:  root.width/11
                    Layout.fillHeight: true
                    text: "\x7F"

                    imageSource: "qrc:/images/backspace.svg"
                    imageScale: 0.75

                    inputPanel: root
                    repeat: true
                    showPreview: false
                }
            }

            // 2
            RowLayout {
                height: pimpl.rowHeight
                width:parent.width

                Item {
                    Layout.maximumWidth: 25
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    visible: root.currentLanguage == "en" || root.currentLanguage == "it"
                }

                Repeater {
                    model: keyModel.secondRowModel
                    delegate: keyButtonDelegate
                }

                KeyButton {
                    id: enterKey
                    color: "#1e1b18"
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    imageSource: "qrc:/images/keyboard_return.svg"
                    imageScale: 0.75


                    inputPanel: root
                    showPreview: false
                    onClicked: {
                        Qt.inputMethod.hide()
                    }
                }
            }

            // 3
            RowLayout {
                width:parent.width
                height: pimpl.rowHeight

                KeyButton {
                    id: shiftKey
                    color: (pimpl.modifier === root.shiftModifier)? "#1e6fa7": "#1e1b18"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: pimpl.modifier === root.symbolModifier ? "1/2" : (pimpl.modifier === root.symbolModifier2 ? "2/2" : "")
                    functionKey: true
                    onClicked: {
                        if (pimpl.modifier === root.shiftModifier) {
                            pimpl.modifier = root.noModifier
                        }
                        else if (pimpl.modifier === root.symbolModifier) {
                            pimpl.modifier = root.symbolModifier2
                        }
                        else if (pimpl.modifier === root.symbolModifier2) {
                            pimpl.modifier = root.symbolModifier
                        }
                        else {
                            pimpl.modifier = root.shiftModifier
                        }
                    }

                    imageSource: text == "" ? "qrc:/images/shift.svg" : ""
                    imageScale: 0.75

                    inputPanel: root
                    showPreview: false
                }

                Repeater {
                    model: keyModel.thirdRowModel
                    delegate: keyButtonDelegate
                }

                KeyButton {
                    id: shiftKey2
                    color: (pimpl.modifier === root.shiftModifier)? "#1e6fa7": "#1e1b18"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: pimpl.modifier === root.symbolModifier ? "1/2" : (pimpl.modifier === root.symbolModifier2 ? "2/2" : "")
                    functionKey: true
                    onClicked: {
                        if (pimpl.modifier === root.shiftModifier) {
                            pimpl.modifier = root.noModifier
                        }
                        else if (pimpl.modifier === root.symbolModifier) {
                            pimpl.modifier = root.symbolModifier2
                        }
                        else if (pimpl.modifier === root.symbolModifier2) {
                            pimpl.modifier = root.symbolModifier
                        }
                        else {
                            pimpl.modifier = root.shiftModifier
                        }
                    }

                    imageSource: text == "" ? "qrc:/images/shift.svg" : ""
                    imageScale: 0.75

                    inputPanel: root
                    showPreview: false
                }
            }

            // 4
            RowLayout {
                width:parent.width
                height: pimpl.rowHeight

                KeyButton {
                    id: symbolKey
                    color: "#1e1b18"
                    Layout.preferredWidth:  2*pimpl.buttonWidth
                    Layout.fillHeight: true
                    text: (pimpl.modifier === root.symbolModifier || pimpl.modifier === root.symbolModifier2)? "ABC" : "&123"
                    functionKey: true
                    onClicked: {
                        if (pimpl.modifier === root.symbolModifier || pimpl.modifier === root.symbolModifier2) {
                            pimpl.modifier = root.noModifier
                        }
                        else {
                            pimpl.modifier = root.symbolModifier
                        }
                    }
                    inputPanel: root
                    showPreview: false
                    fontScale: 0.75
                }

                KeyButton {
                    id: languageKey
                    color: "#1e1b18"
                    Layout.preferredWidth: height
                    Layout.fillHeight: true
                    text: ""

                    imageSource: "qrc:/images/language.svg"
                    imageScale: 0.5

                    inputPanel: root
                    functionKey: true
                    showPreview: false
                    onClicked: {
                        languageModalDialog.visible = true
                    }
                }

                KeyButton {
                    id: spaceKey
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: " "
                    displayText: root.currentLanguageShortcut
                    inputPanel: root
                    showPreview: false
                    fontScale: 0.65

                    Layout.alignment:  Qt.AlignCenter
                }

                KeyButton {
                    Layout.preferredWidth: height
                    Layout.fillHeight: true
                    text: pimpl.modifier === root.symbolModifier ?  "." : (pimpl.modifier === root.symbolModifier2 ? "..." : "'")
                    inputPanel: root
                }

                KeyButton {
                    id: hideKey
                    color: "#1e1b18"
                    Layout.preferredWidth: 2*pimpl.buttonWidth
                    Layout.fillHeight: true

                    imageSource: "qrc:/images/keyboard_hide.svg"
                    imageScale: 0.5

                    text: "\uf078"
                    functionKey: true
                    onClicked: {
                        Qt.inputMethod.hide()
                    }
                    inputPanel: root
                    showPreview: false
                }
            }
        }
    }

    LanguageDialog {
        id: languageModalDialog

        anchors.fill: parent
        visible: false

        onLanguageClicked: {
            root.currentLanguage = identifier
            root.currentLanguageShortcut = shortcut
            keyModel.switchToLanguage(identifier)
        }
    }
}
