import QtQuick
import Quickshell
import Quickshell.Io

// PrettyZap — standalone Quickshell side widget.
//
// A small floating pill at the top-right of the screen that opens/hides
// PrettyZap and exposes a popup with Open / Hide, Settings, and the
// WhatsApp/System theme toggle. Self-contained: only needs Quickshell, not
// Omarchy's qs.Ui kit. Run with:
//
//   quickshell -p ~/.config/quickshell/prettyzap
//   (or copy this folder to ~/.config/quickshell/prettyzap and run `quickshell -c prettyzap`)
//
// The pill floats above windows and reserves no screen space (exclusiveZone 0).
ShellRoot {
  id: root

  // Fixed palette — the standalone widget has no Omarchy Color singleton.
  // Kept dark and semi-transparent so it reads on light and dark backgrounds.
  readonly property color fg: "#e2e8f0"
  readonly property color dim: "#94a3b8"
  readonly property color surface: Qt.rgba(0.03, 0.05, 0.11, 0.86)
  readonly property color surfaceHover: Qt.rgba(0.09, 0.12, 0.22, 0.92)
  readonly property color border: Qt.rgba(1, 1, 1, 0.14)
  readonly property color ok: "#22c55e"
  readonly property color warn: "#f59e0b"
  readonly property color accent: "#38bdf8"

  Data {
    id: data
  }

  readonly property string statusText: {
    if (!data.installed) return "PrettyZap is not installed"
    if (data.running) {
      if (data.theme === "system") return "Running · System theme"
      if (data.theme === "whatsapp") return "Running · WhatsApp theme"
      return "Running"
    }
    return "Not running"
  }

  // ------------------------------------------------------------------ pill

  PanelWindow {
    id: pill
    visible: true
    color: "transparent"
    surfaceFormat.opaque: false
    screen: Quickshell.screens.length > 0 ? Quickshell.screens[0] : null
    anchors {
      top: true
      right: true
    }
    margins {
      top: 8
      right: 8
    }
    exclusionMode: ExclusionMode.Ignore
    exclusiveZone: 0
    aboveWindows: true

    implicitWidth: 44
    implicitHeight: 44

    Rectangle {
      id: pillBg
      anchors.fill: parent
      radius: 14
      color: pillMouse.containsMouse ? root.surfaceHover : root.surface
      border.color: root.border
      border.width: 1

      Behavior on color {
        ColorAnimation { duration: 140 }
      }

      Image {
        id: pillIcon
        anchors.centerIn: parent
        width: 24
        height: 24
        source: Qt.resolvedUrl("assets/prettyzap.svg")
        sourceSize.width: 48
        sourceSize.height: 48
        fillMode: Image.PreserveAspectFit
      }

      // Status dot: green = running, gray = installed but stopped, amber = not installed.
      Rectangle {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 9
        height: 9
        radius: width / 2
        color: data.installed ? (data.running ? root.ok : root.dim) : root.warn
        border.color: root.surface
        border.width: 1.5
      }

      Rectangle {
        visible: data.notificationControlReady
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 9
        height: 9
        radius: width / 2
        color: data.notificationsEnabled ? root.ok : "#ef4444"
        border.color: root.fg
        border.width: 1
      }

      Rectangle {
        visible: data.unreadCount > 0
        anchors.top: parent.top
        anchors.right: parent.right
        width: data.unreadCount >= 100 ? 24 : data.unreadCount >= 10 ? 17 : 14
        height: 14
        radius: height / 2
        color: "#d9485f"
        border.color: root.fg
        border.width: 1

        Text {
          anchors.centerIn: parent
          text: data.unreadCount >= 100 ? "99+" : String(data.unreadCount)
          color: "white"
          font.family: "monospace"
          font.pixelSize: data.unreadCount >= 100 ? 7 : 8
          font.bold: true
        }
      }

      MouseArea {
        id: pillMouse
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        onClicked: function(mouse) {
          if (mouse.button === Qt.RightButton) {
            popup.visible = !popup.visible
            if (popup.visible) popup.reposition()
          } else if (mouse.button === Qt.MiddleButton) {
            data.openSettings()
          } else if (mouse.button === Qt.LeftButton) {
            data.toggle()
          }
        }
      }
    }
  }

  // ---------------------------------------------------------------- popup

  PopupWindow {
    id: popup
    visible: false
    color: "transparent"
    surfaceFormat.opaque: false

    implicitWidth: popupCard.implicitWidth
    implicitHeight: popupCard.implicitHeight

    anchor {
      id: popupAnchor
      window: pill
      adjustment: PopupAdjustment.Slide
      edges: Edges.Left
      gravity: Edges.Right
      rect.width: 1
      rect.height: 1

      onAnchoring: {
        // Popup sits to the left of the pill, vertically centered but never
        // above the screen top (pill is already 8px from the top edge).
        popupAnchor.rect.x = Math.round(-popup.implicitWidth - 8)
        var centered = Math.round((pill.height - popup.implicitHeight) / 2)
        popupAnchor.rect.y = Math.max(centered, -pill.margins.top + 4)
      }
    }

    Rectangle {
      id: popupCard
      implicitWidth: Math.max(232, actionRow.implicitWidth + 24)
      implicitHeight: column.implicitHeight + 24
      radius: 12
      color: Qt.rgba(0.02, 0.04, 0.09, 0.94)
      border.color: root.border
      border.width: 1

      Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 12
        spacing: 10

        // Header
        Row {
          id: headerRow
          width: parent.width
          spacing: 10

          Image {
            width: 22
            height: 22
            source: Qt.resolvedUrl("assets/prettyzap.svg")
            sourceSize.width: 44
            sourceSize.height: 44
            fillMode: Image.PreserveAspectFit
          }

          Column {
            width: parent.width - headerRow.spacing - 22
            spacing: 2

            Text {
              width: parent.width
              text: "PrettyZap"
              color: root.fg
              font.family: "monospace"
              font.pixelSize: 13
              font.bold: true
              elide: Text.ElideRight
            }

            Text {
              width: parent.width
              text: "WhatsApp Web desktop shell"
              color: root.dim
              font.family: "monospace"
              font.pixelSize: 10
              elide: Text.ElideRight
            }
          }
        }

        // Status
        Rectangle {
          width: parent.width
          implicitHeight: statusText.implicitHeight + 8
          radius: 6
          color: data.running ? Qt.rgba(root.ok.r, root.ok.g, root.ok.b, 0.12) : Qt.rgba(1, 1, 1, 0.04)

          Text {
            id: statusText
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            text: root.statusText
            color: root.fg
            font.family: "monospace"
            font.pixelSize: 11
            elide: Text.ElideRight
          }
        }

        // Actions
        Row {
          id: actionRow
          width: parent.width
          spacing: 6

          ActionButton {
            id: openButton
            label: data.running ? "Hide" : "Open"
            enabled: data.installed
            onClicked: {
              if (data.running) data.hide()
              else data.launch()
              popup.visible = false
            }
          }

          ActionButton {
            label: "Settings"
            enabled: data.installed
            onClicked: {
              data.openSettings()
              popup.visible = false
            }
          }

          ActionButton {
            label: "Colors"
            enabled: data.installed
            onClicked: {
              data.openSettings()
              popup.visible = false
            }
          }

          ActionButton {
            label: "Theme"
            enabled: data.running
            onClicked: {
              data.toggleTheme()
              popup.visible = false
            }
          }

          ActionButton {
            label: data.notificationsEnabled ? "Mute" : "Unmute"
            enabled: data.notificationControlReady
            onClicked: {
              data.toggleNotifications()
              popup.visible = false
            }
          }
        }
      }
    }
  }

  // Small custom button so the widget has no QtQuick.Controls dependency.
  component ActionButton: Rectangle {
    id: btn
    property string label: ""
    property bool enabled: true
    signal clicked()

    implicitWidth: 72
    implicitHeight: 30
    radius: 8
    color: btnMouse.containsMouse ? Qt.rgba(1, 1, 1, 0.12) : Qt.rgba(1, 1, 1, 0.05)
    opacity: enabled ? 1 : 0.45

    Text {
      anchors.centerIn: parent
      text: btn.label
      color: root.fg
      font.family: "monospace"
      font.pixelSize: 11
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
      id: btnMouse
      anchors.fill: parent
      hoverEnabled: true
      enabled: btn.enabled
      onClicked: btn.clicked()
    }
  }
}
