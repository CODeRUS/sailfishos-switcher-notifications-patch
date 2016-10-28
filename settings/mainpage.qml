import QtQuick 2.2
import Sailfish.Silica 1.0
import com.jolla.settings 1.0
import org.nemomobile.configuration 1.0

Page {
    id: page

    ConfigurationGroup {
        id: configuration
        path: "/desktop/lipstick-jolla-home"
        property string switcher_notifications_position: "topRight"
        property int switcher_notifications_verticalOffset: 0
        property int switcher_notifications_horizontalOffset: 0
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width

            PageHeader {
                title: qsTr("Notifications in switcher")
            }

            Rectangle {
                id: coverPlaceholder
                color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity)
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.coverSizeLarge.width
                height: Theme.coverSizeLarge.height
                radius: 8

                Image {
                    anchors.fill: parent
                    source: "image://theme/graphic-cover-store-splash"
                }

                Repeater {
                    model: ListModel {
                        ListElement { state: "topRight" }
                        ListElement { state: "topLeft" }
                        ListElement { state: "bottomRight" }
                        ListElement { state: "bottomLeft" }
                        ListElement { state: "center" }
                        ListElement { state: "top" }
                        ListElement { state: "left" }
                        ListElement { state: "right" }
                        ListElement { state: "bottom" }
                    }

                    delegate: BadgeComponent {
                        state: model.state
                        property bool active: configuration.switcher_notifications_position == model.state
                        opacity: active ? 1.0 : 0.2
                        labelVisible: active
                        enabled: !active
                        count: "3"
                        verticalOffset: active ? configuration.switcher_notifications_verticalOffset : 0
                        horizontalOffset: active ? configuration.switcher_notifications_horizontalOffset : 0
                        onClicked: configuration.switcher_notifications_position = model.state
                    }
                }
            }

            Slider {
                width: parent.width
                label: "Horizontal offset"
                minimumValue: -Theme.coverSizeLarge.width
                maximumValue: Theme.coverSizeLarge.width
                stepSize: 1
                value: configuration.switcher_notifications_horizontalOffset
                valueText: "%1px".arg(value)

                onValueChanged: configuration.switcher_notifications_horizontalOffset = value
            }

            Slider {
                width: parent.width
                label: "Vertical offset"
                minimumValue: -Theme.coverSizeLarge.height
                maximumValue: Theme.coverSizeLarge.height
                stepSize: 1
                value: configuration.switcher_notifications_verticalOffset
                valueText: "%1px".arg(value)

                onValueChanged: configuration.switcher_notifications_verticalOffset = value
            }
        }
    }
}
