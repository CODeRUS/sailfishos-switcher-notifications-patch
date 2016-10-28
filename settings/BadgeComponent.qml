import QtQuick 2.0
import Sailfish.Silica 1.0

MouseArea {
    id: notificationBadge
    width: Math.max(height, notificationLabel.paintedWidth)
    height: Theme.iconSizeSmallPlus

    property string count
    property int verticalOffset
    property int horizontalOffset
    property bool labelVisible
    
    Behavior on verticalOffset {
        NumberAnimation { duration: 200 }
    }
    
    Behavior on horizontalOffset {
        NumberAnimation { duration: 200 }
    }
    
    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Rectangle {
        anchors.fill: parent
        radius: height / 2
        border.width: 2
        border.color: Theme.highlightColor
        color: Theme.highlightBackgroundColor
    }

    Label {
        id: notificationLabel
        anchors.centerIn: parent
        font.pixelSize: Theme.iconSizeSmall
        text: notificationBadge.count
        visible: notificationBadge.labelVisible
    }

    states: [
        State {
            name: ""
            extend: "topRight"
        },
        State {
            name: "topRight"
            AnchorChanges {
                target: notificationBadge
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: undefined
                anchors.bottom: undefined
                anchors.verticalCenter: undefined
                anchors.horizontalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.topMargin: -notificationBadge.verticalOffset
                anchors.rightMargin: -notificationBadge.horizontalOffset
            }
        },
        State {
            name: "topLeft"
            AnchorChanges {
                target: notificationBadge
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: undefined
                anchors.bottom: undefined
                anchors.verticalCenter: undefined
                anchors.horizontalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.topMargin: -notificationBadge.verticalOffset
                anchors.leftMargin: notificationBadge.horizontalOffset
            }
        },
        State {
            name: "bottomRight"
            AnchorChanges {
                target: notificationBadge
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.left: undefined
                anchors.top: undefined
                anchors.verticalCenter: undefined
                anchors.horizontalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.bottomMargin: notificationBadge.verticalOffset
                anchors.rightMargin: -notificationBadge.horizontalOffset
            }
        },
        State {
            name: "bottomLeft"
            AnchorChanges {
                target: notificationBadge
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: undefined
                anchors.verticalCenter: undefined
                anchors.horizontalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.bottomMargin: notificationBadge.verticalOffset
                anchors.leftMargin: notificationBadge.horizontalOffset
            }
        },
        State {
            name: "top"
            AnchorChanges {
                target: notificationBadge
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.bottom: undefined
                anchors.verticalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.horizontalCenterOffset: notificationBadge.horizontalOffset
                anchors.topMargin: -notificationBadge.verticalOffset
            }
        },
        State {
            name: "bottom"
            AnchorChanges {
                target: notificationBadge
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.verticalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.horizontalCenterOffset: notificationBadge.horizontalOffset
                anchors.bottomMargin: notificationBadge.verticalOffset
            }
        },
        State {
            name: "left"
            AnchorChanges {
                target: notificationBadge
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: undefined
                anchors.bottom: undefined
                anchors.top: undefined
                anchors.horizontalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.verticalCenterOffset: -notificationBadge.verticalOffset
                anchors.leftMargin: notificationBadge.horizontalOffset
            }
        },
        State {
            name: "right"
            AnchorChanges {
                target: notificationBadge
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.bottom: undefined
                anchors.top: undefined
                anchors.horizontalCenter: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.verticalCenterOffset: -notificationBadge.verticalOffset
                anchors.rightMargin: -notificationBadge.horizontalOffset
            }
        },
        State {
            name: "center"
            AnchorChanges {
                target: notificationBadge
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.bottom: undefined
                anchors.top: undefined
            }
            PropertyChanges {
                target: notificationBadge
                anchors.verticalCenterOffset: -notificationBadge.verticalOffset
                anchors.horizontalCenterOffset: notificationBadge.horizontalOffset
            }
        }
    ]
}