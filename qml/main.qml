import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

import "./Components"

ApplicationWindow {
    id: appId
    visible: true
    width: 500
    height: 500

    /* Prevent crashes on Android when button "back" has pressed. */
    signal startActivity(var parent, string source)


    Text {
        x: parent.width * 0.4
        y: parent.height * 0.5

        width: parent.width * 0.2
        height: parent.height * 0.1

        text: "This is main"
        font.pixelSize: 300
        fontSizeMode: Text.Fit
    }

    Row {
        id:buttonsRow
        width: parent.width
        height: parent.height * 0.2

        Button {
            width: parent.width * 0.33
            height: parent.height

            text: qsTr("Blue rectangle")

            onClicked: {
                startActivity(activityContainer, "qrc:/qml/Blue_Rect.qml")
            }
        }

        Button {
            width: parent.width * 0.33
            height: parent.height

            text: qsTr("Red rectangle")

            onClicked: {
                startActivity(activityContainer, "qrc:/qml/Red_Rect.qml")
            }
        }

        Button {
            width: parent.width * 0.33
            height: parent.height

            text: qsTr("Yellow rectangle")

            onClicked: {
                startActivity(activityContainer, "qrc:/qml/Yellow_Rect.qml")
            }
        }
    }

    Item {
        id: activityContainer
        anchors.fill: parent

        signal unwindStack(var data)

        onUnwindStack:(data) => {
                                   if (data === 1) {
                                       var childs = activityContainer.children[0]

                                       activityContainer.children[0].destroy()
                                   }
        }
    }


    onStartActivity: (parent, source) => {
                         var component = Qt.createComponent("Components/QmlActivity.qml")
                         if( component.status !== Component.Ready )
                         {
                             if( component.status === Component.Error )
                                 console.debug("Error:"+ component.errorString() );
                             return; // or maybe throw
                         }
                         var obj = component.createObject(parent, {
                                                              "source": source,
                                                          })

                         obj.unwindStack.connect(parent.unwindStack)
                     }
}
