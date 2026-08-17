import QtQuick
import Quickshell
import Quickshell.Io

// PrettyZap status + driver for the standalone Quickshell widget.
//
// Watches the app's status file (~/.config/prettyzap/status.json, written by
// the Electron app) for the theme and pid, verifies the pid is alive with
// `kill -0`, and launches the app with fire-and-forget driver flags. The app
// owns single-instance behavior: a second `prettyzap ...` invocation becomes
// a command for the already-running instance.
//
// Credentials never reach QML — this file only reads a theme string, a pid,
// and an on-disk liveness check.
Item {
  id: root
  visible: false

  // Override with the PRETTYZAP_LAUNCH_COMMAND environment variable, or set
  // `launchCommand` from the host (the Omarchy plugin does this from its
  // `launchCommand` setting).
  property string launchCommand: Quickshell.env("PRETTYZAP_LAUNCH_COMMAND") || "uwsm-app -- prettyzap"
  property bool running: false
  property bool installed: true
  property string theme: "" // "whatsapp" | "system" | "" while unknown
  property int pid: 0
  property bool ready: false
  property int unreadCount: 0
  property bool notificationsEnabled: true
  property int checkedPid: 0
  readonly property bool notificationControlReady: root.running && root.ready

  readonly property string home: Quickshell.env("HOME") || ""
  readonly property string statusPath:
    (Quickshell.env("XDG_CONFIG_HOME") || home + "/.config") + "/prettyzap/status.json"

  // The configured launch command, split into argv. The default goes through
  // uwsm-app (the Omarchy-recommended launcher); users on plain Hyprland can
  // set PRETTYZAP_LAUNCH_COMMAND=prettyzap.
  readonly property var launchArgs: {
    var s = String(root.launchCommand || "").trim()
    return s === "" ? ["prettyzap"] : s.split(/\s+/)
  }

  FileView {
    id: statusView
    path: root.statusPath
    watchChanges: true
    printErrors: false
    onFileChanged: reload()
    onLoaded: root.parseStatus(text())
    onLoadFailed: root.resetStatus()
  }

  function resetStatus() {
    root.theme = ""
    root.pid = 0
    root.ready = false
    root.unreadCount = 0
    root.notificationsEnabled = true
    root.running = false
    root.checkedPid = 0
  }

  function parseStatus(content) {
    try {
      var parsed = JSON.parse(String(content || ""))
      if (parsed && typeof parsed === "object") {
        var t = String(parsed.theme || "")
        root.theme = (t === "whatsapp" || t === "system") ? t : ""
        var p = parseInt(parsed.pid, 10)
        var nextPid = isFinite(p) && p > 0 ? p : 0
        if (root.pid !== nextPid) root.running = false
        root.pid = nextPid
        root.ready = parsed.ready === true
        var unread = parseInt(parsed.unreadCount, 10)
        root.unreadCount = isFinite(unread) && unread > 0 ? unread : 0
        root.notificationsEnabled = parsed.notificationsEnabled !== false
      } else {
        root.resetStatus()
      }
    } catch (e) {
      root.resetStatus()
    }
  }

  // Authoritative running check: the status file's pid is alive. `kill -0`
  // avoids matching other processes by name (this widget's own quickshell
  // path also contains "prettyzap").
  Process {
    id: liveness
    running: false
    command: ["sh", "-c", "kill -0 " + root.pid + " 2>/dev/null"]
    onExited: (code) => {
      if (root.pid !== root.checkedPid) return
      if (code === 0) root.running = true
      else root.resetStatus()
    }
  }

  function checkRunning() {
    if (root.pid <= 0) {
      root.resetStatus()
      return
    }
    root.checkedPid = root.pid
    liveness.running = true
  }

  Timer {
    interval: 3000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.checkRunning()
  }

  // The installed check re-runs so installing PrettyZap later flips the
  // widget's hint without a restart.
  Timer {
    interval: 15000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.checkInstalled()
  }

  // Installed check: is `prettyzap` on PATH? Lets the widget show a hint
  // instead of silently doing nothing.
  Process {
    id: whichProc
    running: false
    command: ["sh", "-c", "command -v prettyzap >/dev/null 2>&1"]
    onExited: (code) => root.installed = code === 0
  }

  function checkInstalled() { whichProc.running = true }

  // One-shot launcher for the fire-and-forget driver flags.
  Process {
    id: launcher
    running: false
    command: []

    stderr: StdioCollector {
      waitForEnd: true
      onStreamFinished: if (text.trim() !== "") console.warn("prettyzap-standalone", text.trim())
    }
  }

  function run(args) {
    if (!launcher.running) {
      launcher.command = args
      launcher.running = true
    }
  }

  function launch() { run(root.launchArgs) }                      // open / focus
  function toggle() { run(root.launchArgs.concat(["--toggle"])) } // hide or show
  function hide() { run(root.launchArgs.concat(["--hide"])) }
  function openSettings() { run(root.launchArgs.concat(["--settings"])) }
  function setTheme(mode) { run(root.launchArgs.concat(["--theme=" + String(mode)])) }
  function toggleTheme() {
    if (root.theme === "system") setTheme("whatsapp")
    else setTheme("system")
  }
  function toggleNotifications() {
    if (!root.notificationControlReady) {
      console.warn("prettyzap notifications action ignored: app is not ready")
      return
    }
    run(root.launchArgs.concat(["--notifications=toggle"]))
  }

  Component.onCompleted: {
    root.checkInstalled()
    root.checkRunning()
  }
}
