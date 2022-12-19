import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5


Item {
    id: rootItem

    signal unwindStack(var data)

    Row {
        id: buttonsRow
        width: parent.width
        height: parent.height * 0.2

        Button {
            width: parent.width * 0.33
            height: parent.height

            text: qsTr("Return to main")

            onClicked: {
                unwindStack(1)
            }
        }

        Button {
            width: parent.width * 0.33
            height: parent.height

            text: qsTr("Red rectangle")

            onClicked: {
                startActivity(rootItem, "qrc:/qml/Red_Rect.qml")
            }
        }

        Button {
            width: parent.width * 0.33
            height: parent.height

            text: qsTr("Yellow rectangle")

            onClicked: {
                startActivity(rootItem, "qrc:/qml/Yellow_Rect.qml")
            }
        }
    }

    Rectangle {
        anchors {
            top: buttonsRow.bottom
            bottom: parent.bottom

            left: parent.left
            right: parent.right
        }

        color: "blue"
    }

}
