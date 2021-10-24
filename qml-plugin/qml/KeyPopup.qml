import QtQuick 2.0
import FreeVirtualKeyboard 1.0
import QtQuick.Layouts 1.3

Item {
    id: root

    property color color: "#35322f"

    property alias text: txt.text
    property bool alternativesMode: false

    property int selectedAlternativeIndex: 0
    property string selectedAlternativeText: ""
    property string alternativesText: ""
    property string originalText: ""

    property var keybutton
    property var inputPanel

    onKeybuttonChanged: {
        txt.font.pointSize = Math.max(root.keybutton.height/3,1)
    }

    anchors.fill: parent
    visible: false

    ListModel{
        id: alternativesModel;
    }

    Rectangle {
        id: popupKey
        radius: height / 20
        visible: !root.alternativesMode
        gradient: Gradient {
                 GradientStop { position: 0.0; color: Qt.lighter(Qt.lighter("#35322f"))}
                 GradientStop { position: 1.0; color: Qt.lighter("#35322f")}
        }

        Text {
            id: txt
            color: "white"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            font.pointSize: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: popupAlternatives
        radius: height / 20
        visible: root.alternativesMode

        gradient: Gradient {
                 GradientStop { position: 0.0; color: Qt.lighter(Qt.lighter("#35322f"))}
                 GradientStop { position: 1.0; color: Qt.lighter("#35322f")}
        }

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Repeater {
                model: alternativesModel
                delegate: Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    radius: height / 20

                    color: index == root.selectedAlternativeIndex ? Qt.tint(root.color, "#801e6fa7") : root.color

                    Text {
                        anchors.fill: parent

                        text: name
                        color: "white"

                        fontSizeMode: Text.Fit
                        font.pointSize: root.keybutton.height/3

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }

    Timer {
        id: modeTimer
        interval: 800
        running: false
        repeat: false

        onTriggered: {
            if (root.alternativesText === "") {
                return
            }

            fillModel(root.alternativesText)
            popupAlternatives.width = alternativesModel.count*root.keybutton.width
            root.alternativesMode = true

            root.selectedAlternativeIndex = alternativesModel.count/2
            updatePosition(root.keybutton,root.inputPanel,popupAlternatives)
        }
    }

    function fillModel(alternatives) {
        alternativesModel.clear()
        var i;
        for (i = 0; i < alternatives.length; i++) {
            alternativesModel.append({"name": alternatives[i]})
        }
    }

    function popup(keybutton, inputPanel) {
        // store pointers
        root.keybutton = keybutton
        root.inputPanel = inputPanel

        // set width/height
        popupKey.width = keybutton.width
        popupKey.height = keybutton.height
        popupAlternatives.height = keybutton.height

        // update popup position
        updatePosition(keybutton,inputPanel,popupKey)

        // store text/alternatives
        root.alternativesMode = false
        root.alternativesText = keybutton.alternatives
        root.originalText = keybutton.displayText

        // show
        root.text = root.originalText
        root.visible = Qt.binding(function() {return keybutton.isHighlighted})
    }

    function updateMousePosition(mouseX, mouseY) {

        if (mouseX > 1000) { // ignore invalid position on popup close
            return
        }


        // calculate index
        var position = mouseX + popupAlternatives.width/2

        if (popupAlternatives.x == 0) {
            position -= popupAlternatives.width/2
        }

        if (position < 0) {
            root.selectedAlternativeIndex = 0
        } else if (position > popupAlternatives.width) {
            root.selectedAlternativeIndex = alternativesModel.count - 1
        } else {

            var index = 0
            while(position > root.keybutton.width) {
                position -= root.keybutton.width
                index++
            }

            root.selectedAlternativeIndex = index
        }
    }

    function updatePosition(keybutton, inputPanel, item) {

        // calculate global position
        var KeyButtonGlobalLeft = keybutton.mapToItem(inputPanel, 0, 0).x
        var KeyButtonGlobalTop = keybutton.mapToItem(inputPanel, 0, 0).y
        var PopupGlobalLeft = KeyButtonGlobalLeft - (item.width - keybutton.width) / 2
        var PopupGlobalTop = KeyButtonGlobalTop - item.height - pimpl.verticalSpacing * 1.5

        var PopupLeft = root.parent.mapFromItem(inputPanel, PopupGlobalLeft, PopupGlobalTop).x
        item.y = root.parent.mapFromItem(inputPanel, PopupGlobalLeft, PopupGlobalTop).y

        // check borders
        if (PopupGlobalLeft < 0) {
            item.x = 0
        }
        else if ((PopupGlobalLeft + item.width) > inputPanel.width) {
            item.x = PopupLeft - (PopupGlobalLeft + item.width - inputPanel.width)
        }
        else {
            item.x = PopupLeft
        }
    }

    onVisibleChanged: {
        modeTimer.stop()

        if (!visible) {
            if (root.alternativesMode) {
                var result = text
                if (root.selectedAlternativeIndex >= 0 && root.selectedAlternativeIndex < root.alternativesText.length) {
                    result = root.alternativesText[root.selectedAlternativeIndex]
                }
                InputEngine.sendKeyToFocusItem(result)
            }
            else if (text !== "") {
                InputEngine.sendKeyToFocusItem(text)
            }
        }
        else {
            modeTimer.start()
        }
    }
}
