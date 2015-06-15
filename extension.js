// -*- mode: js; js-indent-level: 4; indent-tabs-mode: nil -*-

const Shell = imports.gi.Shell;
const Main = imports.ui.main;
const Lang = imports.lang;
const Panel = imports.ui.panel;
const PanelMenu = imports.ui.panelMenu;
const NotificationDaemon = imports.ui.notificationDaemon;

let trayAddedId = 0;
let trayRemovedId = 0;
let fullScreenChangedId = 0;
let getSource = null;
let icons = [];

function init() {
    getSource = Lang.bind(Main.notificationDaemon, NotificationDaemon.NotificationDaemon.prototype._getSource);
}

function enable() {
    moveToTop();

    // TrayIcons do not survive leaving the stage (they end up as white squares), so work around this
    // by temporarily move them back to the message tray while we are in fullscreen.
    fullScreenChangedId = Main.layoutManager.connect('primary-fullscreen-changed', function (o, state) {
            if (state) {
                moveToTray();
            }
            else {
                moveToTop();
            }
    });
}

function createSource (title, pid, ndata, sender, trayIcon) { 
  if (trayIcon) {
    onTrayIconAdded(this, trayIcon, title);
    return null;
  }

  return getSource(title, pid, ndata, sender, trayIcon);
};

function onTrayIconAdded(o, icon, role) {
    let wmClass = icon.wm_class ? icon.wm_class.toLowerCase() : '';
    if (NotificationDaemon.STANDARD_TRAY_ICON_IMPLEMENTATIONS[wmClass] !== undefined)
            return;

    let buttonBox = new PanelMenu.ButtonBox();
    let box = buttonBox.actor;
    let parent = box.get_parent();

    icon.height = Panel.PANEL_ICON_SIZE;
    box.add_actor(icon);

    if (parent)
        parent.remove_actor(box);

    icons.push(icon);
    Main.panel._rightBox.insert_child_at_index(box, 0);
}

function onTrayIconRemoved(o, icon) {
    let parent = icon.get_parent();
    parent.destroy();
    icon.destroy();
    icons.splice(icons.indexOf(icon), 1);
}

function moveToTop() {
    Main.notificationDaemon._trayManager.disconnect(Main.notificationDaemon._trayIconAddedId);
    Main.notificationDaemon._trayManager.disconnect(Main.notificationDaemon._trayIconRemovedId);
    trayAddedId = Main.notificationDaemon._trayManager.connect('tray-icon-added', onTrayIconAdded);
    trayRemovedId = Main.notificationDaemon._trayManager.connect('tray-icon-removed', onTrayIconRemoved);
    
    Main.notificationDaemon._getSource = createSource;

    let toDestroy = [];
    for (let i = 0; i < Main.notificationDaemon._sources.length; i++) {
        let source = Main.notificationDaemon._sources[i];
        if (!source.trayIcon)
            continue;
        let parent = source.trayIcon.get_parent();
        parent.remove_actor(source.trayIcon);
        onTrayIconAdded(this, source.trayIcon, source.initialTitle);
        toDestroy.push(source);
    }

     for (let i = 0; i < toDestroy.length; i++) {
        toDestroy[i].destroy();
     }
}

function moveToTray() {
    if (trayAddedId != 0) {
        Main.notificationDaemon._trayManager.disconnect(trayAddedId);
        trayAddedId = 0;
    }

    if (trayRemovedId != 0) {
        Main.notificationDaemon._trayManager.disconnect(trayRemovedId);
        trayRemovedId = 0;
    }
    
    Main.notificationDaemon._trayIconAddedId = Main.notificationDaemon._trayManager.connect('tray-icon-added',
                                                Lang.bind(Main.notificationDaemon, Main.notificationDaemon._onTrayIconAdded));
    Main.notificationDaemon._trayIconRemovedId = Main.notificationDaemon._trayManager.connect('tray-icon-removed', 
                                                Lang.bind(Main.notificationDaemon, Main.notificationDaemon._onTrayIconRemoved));

    Main.notificationDaemon._getSource = getSource;

    for (let i = 0; i < icons.length; i++) {
        let icon = icons[i];
        let parent = icon.get_parent();
        parent.remove_actor(icon);
        parent.destroy();
        Main.notificationDaemon._onTrayIconAdded(Main.notificationDaemon, icon);
    }
    
    icons = [];
}

function disable() {
    moveToTray();

    if (fullScreenChangedId != 0) {
        Main.layoutManager.disconnect(fullScreenChangedId);
        fullScreenChangedId = 0;
    }
}
