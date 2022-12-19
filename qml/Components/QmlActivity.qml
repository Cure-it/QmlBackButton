import QtQuick 2.15

Item {
    property string source: ""

    signal unwindStack(var data)

    anchors.fill: parent

    Loader {
        id: contentKeeper
        anchors.fill: parent
        source: parent.source

        onLoaded: {
            console.log("loaded "+parent.source)
            forceActiveFocus()
        }
    }

    Keys.onReleased: (event)=> {
        if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape) {
            event.accepted = true
            destroy()
        }
    }

    Component.onCompleted: {
        contentKeeper.item.unwindStack.connect(unwindStack)
    }

    Component.onDestruction: {
        console.log(source)
    }
}
