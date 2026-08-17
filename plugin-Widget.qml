import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

// PrettyZap's native Quattro bar widget. The bar owns the trigger and the
// PopupCard owns the detail surface; there is no second panel/window here.
BarWidget {
  id: root
  moduleName: "prettyletto.prettyzap"
  property bool popupOpen: false
  readonly property color foreground: bar ? bar.foreground : Color.foreground
  // Omarchy's bar API exposes live palette colors rather than a boolean theme
  // flag. The bar background is the most reliable light/dark signal and
  // re-evaluates automatically when the active Omarchy theme changes.
  readonly property bool isDark: {
    var surface = bar ? bar.background : Color.background
    var luminance = (0.2126 * surface.r) + (0.7152 * surface.g) + (0.0722 * surface.b)
    return luminance < 0.5
  }

  function open() { popupOpen = true }
  function close() { popupOpen = false }
  function toggle() { popupOpen = !popupOpen }
  function statusText() {
    if (!data.installed) return "Not installed"
    if (data.running && !data.ready) return "Starting…"
    if (data.appVisible) return "Open · " + themeLabel()
    if (data.running) return "Hidden · " + themeLabel()
    return "Closed"
  }
  function themeLabel() {
    return data.theme === "system" ? "System theme" : "WhatsApp theme"
  }
  function toggleApp() { data.toggle() }
  function handleBarClick(buttonCode) {
    if (buttonCode === Qt.RightButton) root.toggle()
    else if (buttonCode === Qt.MiddleButton) data.openSettings()
    else data.toggle()
  }
  // Quattro's bar host and keyboard panel dispatch module clicks through this
  // contract. The app owns the authoritative visibility decision; the status
  // file is only a presentation hint for this widget.
  function triggerPress(buttonCode) { handleBarClick(buttonCode) }
  Data { id: data }

  Component.onCompleted: {
    data.launchCommand = String(setting("launchCommand", "uwsm-app -- prettyzap"))
    root.showBrand = String(setting("icon", "glyph")) === "brand"
  }

  // This follows Quattro's documented third-party bar-widget pattern: the
  // entry point is a BarWidget with explicit geometry and a plain MouseArea.
  implicitWidth: Style.bar.statusSlot
  implicitHeight: barSize

  // Icon surface: the declared `icon` setting switches between the themed
  // PrettyZap brand mark and the WhatsApp glyph.
  property bool showBrand: false

  Image {
    visible: root.showBrand
    anchors.centerIn: parent
    // The supplied mark has transparent padding, so give it a larger surface
    // than the text glyph while keeping it within the bar's vertical bounds.
    width: Math.min(barSize, Style.space(24))
    height: Math.min(barSize, Style.space(24))
    source: Qt.resolvedUrl(root.isDark
      ? "assets/prettyzap-widget-dark.png"
      : "assets/prettyzap-widget-light.png")
    sourceSize.width: 32
    sourceSize.height: 32
    fillMode: Image.PreserveAspectFit
  }

  Text {
    visible: !root.showBrand
    anchors.centerIn: parent
    text: "󰖣"
    color: "#3b82f6"
    opacity: data.running ? 0.16 : 0
    scale: 1.55
    font.family: root.bar ? root.bar.fontFamily : Style.font.family
    font.pixelSize: Style.bar.iconFont + Style.space(2)
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  Text {
    visible: !root.showBrand
    anchors.centerIn: parent
    text: "󰖣"
    color: "#60a5fa"
    opacity: data.running ? 0.28 : 0
    scale: 1.24
    font.family: root.bar ? root.bar.fontFamily : Style.font.family
    font.pixelSize: Style.bar.iconFont + Style.space(2)
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  Text {
    visible: !root.showBrand
    anchors.centerIn: parent
    text: "󰖣"
    color: data.running ? "#bfdbfe" : root.foreground
    font.family: root.bar ? root.bar.fontFamily : Style.font.family
    font.pixelSize: Style.bar.iconFont + Style.space(2)
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  Rectangle {
    visible: data.unreadCount > 0
    anchors.top: parent.top
    anchors.right: parent.right
    width: data.unreadCount >= 100
      ? Style.space(24)
      : data.unreadCount >= 10 ? Style.space(17) : Style.space(14)
    height: Style.space(14)
    radius: height / 2
    color: "#d9485f"
    border.color: root.foreground
    border.width: 1

    Text {
      anchors.centerIn: parent
      text: data.unreadCount >= 100 ? "99+" : String(data.unreadCount)
      color: "white"
      font.family: root.bar ? root.bar.fontFamily : Style.font.family
      font.pixelSize: data.unreadCount >= 100 ? 7 : 8
      font.bold: true
    }
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
    cursorShape: Qt.PointingHandCursor
    onClicked: function(mouse) { root.handleBarClick(mouse.button) }
  }

  PopupCard {
    id: popup
    anchorItem: root
    bar: root.bar
    owner: root
    open: root.popupOpen
    contentWidth: popup.fittedContentWidth(Style.space(280))
    contentHeight: popup.fittedContentHeight(contentColumn.implicitHeight)

    Column {
      id: contentColumn
      width: parent.width
      spacing: Style.space(10)

      Row {
        width: parent.width
        spacing: Style.space(10)

        Text {
          width: Style.space(36)
          height: Style.space(36)
          text: "󰖣"
          color: root.foreground
          font.family: root.bar.fontFamily
          font.pixelSize: Style.font.title
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
        }

        Column {
          anchors.verticalCenter: parent.verticalCenter
          spacing: Style.space(2)

          Text {
            text: "PrettyZap"
            color: root.foreground
            font.family: root.bar.fontFamily
            font.pixelSize: Style.font.body
            font.bold: true
          }

          Text {
            text: root.statusText()
            color: Qt.darker(root.foreground, 1.45)
            font.family: root.bar.fontFamily
            font.pixelSize: Style.font.bodySmall
          }
        }
      }

      PanelSeparator { foreground: root.foreground }

      Button {
        width: parent.width
        text: data.appVisible ? "Hide PrettyZap" : "Open PrettyZap"
        iconText: data.appVisible ? "󰍃" : "󰖰"
        leftAlign: true
        foreground: root.foreground
        onClicked: { root.toggleApp(); root.close() }
      }

      Button {
        width: parent.width
        text: "Settings"
        iconText: "󰒓"
        leftAlign: true
        foreground: root.foreground
        onClicked: { data.openSettings(); root.close() }
      }

      Button {
        width: parent.width
        text: "Colors…"
        iconText: "󰏘"
        leftAlign: true
        foreground: root.foreground
        onClicked: { data.openSettings(); root.close() }
      }

      Button {
        width: parent.width
        text: data.theme === "system" ? "Use WhatsApp theme" : "Use System theme"
        iconText: "󰔎"
        leftAlign: true
        foreground: root.foreground
        enabled: data.running
        onClicked: { data.toggleTheme(); root.close() }
      }

      Button {
        width: parent.width
        text: data.notificationsEnabled ? "Disable notifications" : "Enable notifications"
        iconText: data.notificationsEnabled ? "󰂛" : "󰂚"
        leftAlign: true
        foreground: root.foreground
        enabled: data.notificationControlReady
        onClicked: { data.toggleNotifications(); root.close() }
      }

      Button {
        width: parent.width
        text: "Quit PrettyZap"
        iconText: "󰗼"
        leftAlign: true
        foreground: root.foreground
        enabled: data.running
        onClicked: { data.quit(); root.close() }
      }
    }
  }
}
