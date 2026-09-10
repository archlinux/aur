const { app, Tray, Menu, nativeImage } = require('electron');
const fs = require('fs');
const path = require('path');

const ICON_PATHS = [
    path.join(__dirname, 'icon.png'),
    path.join(__dirname, '..', 'icon.png'),
    '/usr/share/icons/hicolor/256x256/apps/superhuman.png',
    '/opt/superhuman/superhuman.png'
];

let tray = null;

function getIconPath() {
    for (const iconPath of ICON_PATHS) {
        try {
            if (fs.existsSync(iconPath)) {
                return iconPath;
            }
        } catch (e) {
            continue;
        }
    }
    return null;
}

function getWindows() {
    const main = global.main;
    if (!main || !Array.isArray(main.windows)) {
        return [];
    }
    return main.windows.map(entry => entry.window).filter(window => window && !window.isDestroyed());
}

function showWindow(window) {
    window.show();
    window.focus();
    if (window.webContents) {
        window.webContents.invalidate();
    }
}

function toggleWindows() {
    const windows = getWindows();
    if (!windows.length) {
        return;
    }

    if (windows.some(window => window.isVisible())) {
        windows.forEach(window => window.hide());
    } else {
        showWindow(windows[0]);
    }
    rebuildTrayMenu();
}

function rebuildTrayMenu() {
    if (!tray) {
        return;
    }

    const anyVisible = getWindows().some(window => window.isVisible());

    tray.setContextMenu(Menu.buildFromTemplate([
        {
            label: anyVisible ? 'Hide Superhuman' : 'Show Superhuman',
            click: toggleWindows
        },
        { type: 'separator' },
        {
            label: 'New Window',
            click: () => {
                if (global.main && typeof global.main.createWindow === 'function') {
                    void global.main.createWindow({});
                }
            }
        },
        { type: 'separator' },
        {
            label: 'Quit Superhuman',
            click: () => app.quit()
        }
    ]));
}

function createTray() {
    if (tray) {
        return;
    }

    const iconPath = getIconPath();
    const icon = iconPath
        ? nativeImage.createFromPath(iconPath).resize({ width: 22, height: 22 })
        : nativeImage.createEmpty();

    tray = new Tray(icon);
    tray.setToolTip('Superhuman');
    tray.on('click', toggleWindows);
    rebuildTrayMenu();
}

function trackWindow(window) {
    window.on('show', rebuildTrayMenu);
    window.on('hide', rebuildTrayMenu);
    window.on('closed', rebuildTrayMenu);
}

function init() {
    createTray();
    app.on('browser-window-created', (event, window) => trackWindow(window));
}

if (app.requestSingleInstanceLock()) {
    app.on('window-all-closed', () => {});

    app.on('activate', () => {
        const windows = getWindows();
        if (windows.length) {
            showWindow(windows[0]);
        }
    });

    app.on('will-quit', () => {
        if (tray) {
            tray.destroy();
            tray = null;
        }
    });

    if (app.isReady()) {
        init();
    } else {
        void app.whenReady().then(init);
    }
}

module.exports = { createTray, rebuildTrayMenu };
