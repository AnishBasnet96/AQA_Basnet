import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    id:root
    property string text: ""
    property string iconSource: ""

    property int w: 72
    property int h: 72

    width: w
    height: h

    property real cornerRadius: 20

    property color buttonBorderColor: "black"
    property color buttonFaceColor: "white"

    property real borderLeftWidth: 2.0
    property real borderRightWidth: 4.0
    property real borderBottomWidth: 10.0

    property real baseBorderWidth: 8.0

    property alias faceColor: face.color
    property alias textColor: face.textColor
    property alias iconColor: face.iconColor
    property alias fontText: face.fontText

    property alias borderColor: borderBase.border.color

    signal clicked (string text);

    Rectangle
    {
        id: borderBase
        anchors.fill: parent
        color: root.buttonFaceColor
        border.color: root.buttonBorderColor
        border.width: root.baseBorderWidth
        radius: root.cornerRadius
    }

    Rectangle
    {
        id:face
        anchors.fill:borderBase
        anchors.topMargin: 1

        anchors.rightMargin: root.borderRightWidth
        anchors.leftMargin: root.borderLeftWidth
        anchors.bottomMargin: root.borderBottomWidth

        radius: root.cornerRadius - baseBorderWidth/2

        property alias textColor: label.color
        property alias iconColor: icon.color
        property alias fontText: label.font

        color: root.buttonFaceColor

        Row
        {
            id:row
            anchors.centerIn: parent
            spacing: (root.text !== "" && root.iconSource != "") ? 10: 0

            Text
            {
                id: label
                visible: root.text !== ""
                text:  root.text
                anchors.verticalCenter:  parent.verticalCenter
                wrapMode: Text.WordWrap
            }

            IconImage
            {
                id: icon
                visible: root.iconSource !== ""
                source:  root.iconSource
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter:  parent.verticalCenter
                smooth: true
            }
        }
    }

    MouseArea
    {
        id:mouse
        anchors.fill:parent
        enabled: true
        onClicked: root.clicked(root.text)
    }


}
