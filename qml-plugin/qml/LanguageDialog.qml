import QtQuick 2.0
import "."
import FreeVirtualKeyboard 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: root

    signal languageClicked(string identifier,string shortcut)

    MouseArea {
        anchors.fill: parent

        onClicked: {
            root.visible = false
        }

        Rectangle {
            width: parent.width/3.5
            height: pimpl.rowHeight*2.5

            y: root.height - pimpl.rowHeight - pimpl.verticalSpacing*2 - height

            Column {
                anchors.fill: parent

                Repeater {
                    id: rep
                    model: keyModel.languagesModel
                    delegate: Text {
                        text: name
                        width: parent.width
                        height: parent.height/rep.count
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: height/3
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                root.visible = false
                                root.languageClicked(identifier,shortcut)                                
                            }
                        }
                    }
                }
            }
        }
    }
}