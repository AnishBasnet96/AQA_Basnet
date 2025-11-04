import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow
{
    id:win
    visible: true
    title: qsTr("AQA_Basnet")

    property bool dark: false

    QtObject
    {
        id: properties
        readonly property int winWidth: 1024
        readonly property int winHeight: 768
        readonly property int margins: 20
        readonly property int timing: 1000
    }

    QtObject
    {
        id: fonts
        readonly property font buttonText: Qt.font({ family: "Roboto", pixelSize: 24 })
        readonly property font labelText: Qt.font({ family: "Roboto", pixelSize: 12 })
    }

    // Icons
    QtObject {
        id: icons
        readonly property string football: "qrc:/icons/futbol.svg"
        readonly property string leaf:     "qrc:/icons/leaf.svg"
        readonly property string mars:     "qrc:/icons/mars.svg"
        readonly property string venus:    "qrc:/icons/venus.svg"
        readonly property string baby:     "qrc:/icons/baby.svg"
        readonly property string child:    "qrc:/icons/child-dress.svg"
        readonly property string adult:    "qrc:/icons/person-dress.svg"
        readonly property string childM:   "qrc:/icons/child.svg"
        readonly property string adultM:   "qrc:/icons/person.svg"
        readonly property string elder:    "qrc:/icons/person-cane.svg"
        readonly property string carriage: "qrc:/icons/baby-carriage.svg"
        readonly property string lungs:    "qrc:/icons/lungs.svg"
        readonly property string toggle:   "qrc:/icons/circle-half-stroke.svg"
        readonly property string powerOff: "qrc:/icons/power-off.svg"
        readonly property string play : "qrc:/icons/play.svg"
        readonly property string hand: "qrc:/icons/hand.svg"
    }

    minimumWidth: properties.winWidth
    maximumWidth: properties.winWidth

    minimumHeight: properties.winHeight
    maximumHeight: properties.winHeight

    property color babyTint: dark ? "#FFB6C1" : "#FFC0CB"
    property color childTint:  dark? "#87CEFA" : "#87CEEB"
    property color adultTint: dark? "#778899" : "#708090"
    property color elderTint:  dark? "#FFD700" : "#DAA520"

    color: dark? "#333333" : "#FFFFFF"

    property real animT: core.mode === "healing" ? 1 : 0

    property color iconTextColor: dark? "#FFFFFF" : "#696969"

    property string child:  core.gender ===1 ? icons.child: icons.childM
    property string adult:  core.gender ===1 ? icons.adult: icons.adultM

    function ageIcon(a)
    {
        return a===0? icons.baby : a===1? win.child : a===2? win.adult : icons.elder
    }

    function bottomIcon(a)
    {
        return a===0? icons.carriage : a===1? icons.football : a===2? icons.lungs : icons.leaf
    }

    function bottomTint(a)
    {
        return a===0? win.babyTint : a===1? win.childTint : a===2? win.adultTint : win.elderTint
    }

    Row
    {
        id: topBar

        spacing: properties.margins/2
        anchors.left: parent.left
        anchors.top: parent.top

        anchors.margins: properties.margins

        BaseButton
        {
            iconSource: icons.powerOff
            iconColor: win.iconTextColor
            textColor: win.iconTextColor
            faceColor: win.color
            borderColor:  win.iconTextColor
        }

        BaseButton
        {
            iconSource: icons.toggle
            iconColor: win.iconTextColor
            textColor: win.iconTextColor
            faceColor: win.color
            borderColor:  win.iconTextColor

            onClicked:
            {
                win.dark = !win.dark
            }
        }

    }

    Column
    {
        id: favoritePlanetColumn
        anchors.left: parent.left
        anchors.top: topBar.bottom
        anchors.margins: properties.margins

        spacing: properties.margins/2

        Text
        {
            text: "Favorite planet:"
            color: win.iconTextColor
            font:  fonts.labelText
        }

        Row
        {
            spacing: properties.margins/2

            BaseButton
            {
                iconSource: icons.mars
                iconColor: win.iconTextColor
                textColor: win.iconTextColor
                faceColor: win.color
                borderColor:  win.iconTextColor

                onClicked:
                {
                    core.setgender(0)
                }
            }

            BaseButton
            {
                iconSource: icons.venus
                iconColor: win.iconTextColor
                textColor: win.iconTextColor
                faceColor: win.color
                borderColor:  win.iconTextColor

                onClicked:
                {
                    core.setgender(1)
                }
            }
        }
    }

    Column
    {
        id: ageGroupColumn
        anchors.left: parent.left
        anchors.top: favoritePlanetColumn.bottom
        anchors.margins: properties.margins

        spacing: properties.margins/2

        Text
        {
            text: "Age group:"
            color: win.iconTextColor
            font:  fonts.labelText
        }

        Row
        {
            spacing: properties.margins/2

            Repeater
            {
                model: 4

                delegate: Component
                {
                    BaseButton
                    {
                        iconSource: ageIcon(model.index)
                        iconColor: win.iconTextColor
                        textColor: win.iconTextColor
                        faceColor: win.color
                        borderColor:  win.iconTextColor

                        onClicked:
                        {
                            core.setage(model.index)
                        }
                    }
                }
            }
        }
    }

}
