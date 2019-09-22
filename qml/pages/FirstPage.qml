import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Standart Control")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Enter the number")
                color: Theme.secondaryHighlightColor
                //anchors.centerIn: parent
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                width: page.width/2
                placeholderText: "Number..."
            }

            Button {
                id: press_but
                text: "Press me"
                onClicked: {
                    press_but.down = true;
                }
            }
            Button {
                text: "Press"
                anchors.horizontalCenter: parent.horizontalCenter
                y: press_but.y + 100
                onPressedButtonsChanged: {
                    if(down) {
                        press_label.text = "Pressed"
                    } else {
                        press_label.text = "Not pressed"
                    }
                }

            }
            Label {
                id: press_label
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Not pressed"
            }

            ValueButton {
                label: "Counter"
                property int count: 0
                value: count
                onClicked: count++
                description: "Calculate number of press"
            }
            DatePicker {
                daysVisible: true
                monthYearVisible: true
                date: new Date()
                onDateTextChanged: console.log(dateText)
            }
            Item {
                width: 300
                height: 300
                TimePicker {
                    id: time_p
                    onTimeTextChanged: console.log(timeText)
                }
                Label {
                    id: time_label
                    anchors.centerIn: time_p
                    text: time_p.timeText
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
            }
            Rectangle {
                width: 300
                height: 300
                color: "transparent"
            }

            ComboBox {
                label: "List"
                description: "Choose something"
                menu: ContextMenu {
                    MenuItem {text: "first" }
                    MenuItem {text: "second" }
                    MenuItem {text: "third" }
                }
                onCurrentIndexChanged: console.log(menu.children[currentIndex].text)
            }
            Switch {
                id: sw
                anchors.horizontalCenter: parent.horizontalCenter
                iconSource: "image://theme/icon-m-speaker-mute?"
                            + (checked ? Theme.highlightColor : Theme.primaryColor);
            }
            Label {
                id: sw_label
                anchors.horizontalCenter: parent.horizontalCenter
                text: sw.checked ? "Enable" : "Disable";
            }
            Slider {
                id: slider
                width: parent.width
                label: "Current value : 0"
                minimumValue: 0
                maximumValue: 100
                stepSize: 1
                onValueChanged: slider.label = "Current value : " + value
            }
        }
    }
}
