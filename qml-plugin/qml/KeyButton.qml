import QtQuick 2.0
import FreeVirtualKeyboard 1.0

Item {
    id: root
    /**
     * The background color of this button
     */
    property color color: "#35322f"

    /**
     * The key text to show in this button
     */
    property string text

    property string alternatives

    /**
     * The font for rendering of text
     */
    property alias font: txt.font

    /**
     * The color of the text in this button
     */
    property alias textColor: txt.color


    property string imageSource: ""
    property double imageScale: 1.0

    /**
     * This property holds the pressed status of the key.
     */
    property alias isPressed: buttonMouseArea.pressed

    /**
     * This property holds a reference to the input panel.
     * A key can only show the charcter preview popup if this property contains
     * a valid refernce to the input panel
     */
    property var inputPanel

    /**
     * This property holds the highlighted status of the key
     * The highlighted status is a little bit different from the pressed status
     * If the user releases the key, it is not pressed anymore, but it is still
     * highlighted for some milliseconds
     */
    property bool isHighlighted: false

    /**
     * Sets the show preview attribute for the character preview key popup
     */
    property bool showPreview: true

    /**
     * Sets the key repeat attribute.
     * If the repeat is enabled, the key will repeat the input events while held down.
     * The default is false.
     */
    property bool repeat: false

    /**
     * Sets the key code for input method processing.
     */
    property int key:0

    /**
     * Sets the display text - this string is rendered in the keyboard layout.
     * The default value is the key text.
     */
    property alias displayText: txt.text

    /**
     * Sets the function key attribute.
     */
    property bool functionKey: false

    property double fontScale: 1.0

    signal clicked()
    signal pressed()
    signal released()

    Rectangle {
        anchors.fill: parent
        radius: height / 20
        color: isHighlighted ? Qt.tint(root.color, "#801e6fa7") : root.color

        Text {

            id: txt
            color: "white"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            font.pointSize: Math.max(root.height/3*root.fontScale, 1)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: root.text

            visible: root.imageSource === ""
        }


        onHeightChanged: {
            if (height < width) {
                image.size = height
            }
            else {
                image.size = width
            }
        }

        onWidthChanged: {
            if (height < width) {
                image.size = height
            }
            else {
                image.size = width
            }
        }

        Image {
            id: image

            property int size: 10
            anchors.centerIn: parent

            width: size*root.imageScale
            height: size*root.imageScale


            source: root.imageSource
            visible: root.imageSource !== ""
            fillMode: Image.PreserveAspectFit
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
        }
    }

    Timer {
        id: highlightTimer
        interval: 100
        running: !isPressed
        repeat: false

        onTriggered: {
            isHighlighted = false;
        }
    }

    Timer {
        id: repeatTimer
        interval: 500
        repeat: true
        running: root.repeat && root.isPressed

        onTriggered: {
            if (root.state == "") {
                root.state = "REPEATING"
            }

            if (!functionKey && (text === "\x7F" || text === " ")) {
                InputEngine.sendKeyToFocusItem(text)
            }
        }
    }

    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent
        onClicked: {root.clicked()}
        onPressed: {root.pressed()}
        onReleased: {root.released()}
        onPositionChanged: {
            inputPanel.updateKeyPopupMousePosition(mouseX, mouseY)
        }
        hoverEnabled: true
    }

    onInputPanelChanged: {
        //console.log("onInputPanelChanged: " + inputPanel.objectName);
    }

    /**
     * If the InputPanel property has a valid InputPanel reference and if
     * showPreview is true, then this function calls showKeyPopup() to
     * show the character preview popup.
     */
    onPressed: {
        if (inputPanel != null && showPreview) {
            inputPanel.showKeyPopup(root);
        }
        isHighlighted = true;
    }

    onReleased: {
        state = ""

        if (root.alternatives !== "") {
            return
        }

        //console.log("onReleased - functionKey = " + functionKey)
        if (!functionKey && (text === "\x7F" || text === " ")) {
            InputEngine.sendKeyToFocusItem(text)
        }
    }

    states: [
        State {
            name: "REPEATING"
            PropertyChanges { target: repeatTimer; interval: 50}
        }
    ]

}
