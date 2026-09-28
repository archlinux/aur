const { app, Tray, Menu, clipboard, dialog, nativeImage } = require('electron');
const fs = require('fs');
const path = require('path');

const ICON_PATHS = [
    path.join(__dirname, 'icon.png'),
    path.join(__dirname, '..', 'icon.png'),
    '/usr/share/icons/hicolor/256x256/apps/superhuman.png',
    '/opt/superhuman/superhuman.png'
];

const LOGIN_ORIGIN = 'https://mail.superhuman.com';

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

function toLoginHandoffUrl(text) {
    let url;
    try {
        url = new URL(text.trim());
    } catch (e) {
        return null;
    }
    if (url.origin !== LOGIN_ORIGIN || !url.pathname.startsWith('/~login')) {
        return null;
    }

    const fragment = url.hash.replace(/^#/, '').replace(/#app$/, '');
    const state = new URLSearchParams(fragment).get('state') || '';
    const email = new URLSearchParams(state.replace('native-login:', '')).get('emailAddress');
    const externalAuthId = url.searchParams.get('external_auth_id');
    const query = externalAuthId ? `?${new URLSearchParams({ external_auth_id: externalAuthId })}` : '';

    return `superhuman:/${email ? `/${email}` : ''}${url.pathname}/${query}${fragment}`;
}

function completeLogin(text) {
    const url = toLoginHandoffUrl(text);
    if (!url || !global.main) {
        return false;
    }
    global.main.openUrl(null, url);
    return true;
}

function completeLoginFromClipboard() {
    if (completeLogin(clipboard.readText())) {
        return;
    }
    void dialog.showMessageBox({
        type: 'info',
        message: 'No Superhuman sign-in link on the clipboard',
        detail: 'After signing in with Google in your browser, copy the full address of the Superhuman page it lands on (it starts with https://mail.superhuman.com/~login) and try again.'
    });
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
        {
            label: 'Finish Sign-In from Clipboard',
            click: completeLoginFromClipboard
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

function honorHiddenLaunch() {
    if (!process.argv.includes('--hidden')) {
        return;
    }
    const getLoginItemSettings = app.getLoginItemSettings.bind(app);
    app.getLoginItemSettings = options => ({
        ...getLoginItemSettings(options),
        wasOpenedAtLogin: true,
        wasOpenedAsHidden: true
    });
}

function forwardLaunchUrl() {
    const url = process.argv.slice(1).find(arg => /^(mailto|superhuman):/i.test(arg));
    if (url) {
        app.once('ready', () => app.emit('open-url', { preventDefault() {} }, url));
    }
}

if (app.requestSingleInstanceLock()) {
    honorHiddenLaunch();
    forwardLaunchUrl();

    app.on('window-all-closed', () => {});

    app.on('second-instance', (event, argv) => {
        argv.some(completeLogin);
    });

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
