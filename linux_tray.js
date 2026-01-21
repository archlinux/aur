// Superhuman Linux - Tray Module (Close to Tray)
const { app, Tray, Menu, nativeImage, BrowserWindow } = require('electron');
const path = require('path');

let tray = null;
let isQuitting = false;

function getIconPath() {
    const possiblePaths = [
        path.join(__dirname, 'icon.png'),
        path.join(__dirname, '..', 'icon.png'),
        '/usr/share/icons/hicolor/256x256/apps/superhuman.png',
        '/opt/superhuman/superhuman.png',
    ];
    for (const iconPath of possiblePaths) {
        try {
            if (require('fs').existsSync(iconPath)) {
                return iconPath;
            }
        } catch (e) {}
    }
    return null;
}

function getVisibleWindow() {
    const allWindows = BrowserWindow.getAllWindows();
    for (const win of allWindows) {
        const bounds = win.getBounds();
        if (bounds.width > 100 && bounds.height > 100) {
            return win;
        }
    }
    return allWindows[0] || null;
}

function showWindow(win) {
    if (!win) return;
    win.show();
    win.focus();
    // Force repaint - Electron sometimes doesn't redraw after hide/show
    if (win.webContents) {
        win.webContents.invalidate();
    }
}

function rebuildTrayMenu() {
    if (!tray) return;

    const visibleWin = getVisibleWindow();
    const isVisible = visibleWin && visibleWin.isVisible();

    const menuItems = [
        {
            label: isVisible ? 'Hide Superhuman' : 'Show Superhuman',
            click: () => {
                const win = getVisibleWindow();
                if (win) {
                    if (win.isVisible()) {
                        win.hide();
                    } else {
                        showWindow(win);
                    }
                    rebuildTrayMenu();
                }
            }
        },
        { type: 'separator' },
        {
            label: 'New Window',
            click: () => {
                if (global.main && typeof global.main.createWindow === 'function') {
                    global.main.createWindow({});
                }
            }
        },
        { type: 'separator' },
        {
            label: 'Quit Superhuman',
            click: () => {
                isQuitting = true;
                app.quit();
            }
        }
    ];

    tray.setContextMenu(Menu.buildFromTemplate(menuItems));
}

function createTray() {
    if (tray) return;

    const iconPath = getIconPath();
    let icon;

    if (iconPath) {
        icon = nativeImage.createFromPath(iconPath);
        icon = icon.resize({ width: 22, height: 22 });
    } else {
        icon = nativeImage.createEmpty();
    }

    tray = new Tray(icon);
    tray.setToolTip('Superhuman');
    rebuildTrayMenu();

    tray.on('click', () => {
        const win = getVisibleWindow();
        if (win) {
            if (win.isVisible()) {
                win.hide();
            } else {
                showWindow(win);
            }
            rebuildTrayMenu();
        }
    });
}

function setupWindowCloseToTray(window) {
    const bounds = window.getBounds();
    const isVisibleWindow = bounds.width > 100 && bounds.height > 100;

    if (!isVisibleWindow) return; // Skip background windows

    // console.log('[Superhuman Linux] Setting up close handler for window');

    // Intercept the close method itself (custom UI X button may call this)
    const originalClose = window.close.bind(window);
    window.close = function() {
        // console.log('[Superhuman Linux] window.close() called, isQuitting:', isQuitting);
        if (!isQuitting) {
            window.hide();
            rebuildTrayMenu();
        } else {
            originalClose();
        }
    };

    // Also handle the close event (for system close button)
    window.on('close', (event) => {
        // console.log('[Superhuman Linux] Window close event, isQuitting:', isQuitting);
        if (!isQuitting) {
            event.preventDefault();
            window.hide();
            rebuildTrayMenu();
            return false;
        }
        return true;
    });

    window.on('show', () => {
        // Force repaint when window is shown (fixes blank content after hide)
        if (window.webContents) {
            window.webContents.invalidate();
        }
        rebuildTrayMenu();
    });
    window.on('hide', () => { rebuildTrayMenu(); });
}

function init() {
    // console.log('[Superhuman Linux] Tray module initializing...');
    createTray();

    // Set up close-to-tray for all windows
    app.on('browser-window-created', (event, window) => {
        // console.log('[Superhuman Linux] Window created, setting up close-to-tray');
        setupWindowCloseToTray(window);
    });

    // Also handle existing windows
    const existing = BrowserWindow.getAllWindows();
    // console.log('[Superhuman Linux] Found', existing.length, 'existing windows');
    for (const window of existing) {
        setupWindowCloseToTray(window);
    }
}

// Intercept quit attempts - only allow if user explicitly chose Quit from tray
const originalQuit = app.quit.bind(app);
app.quit = function() {
    // console.log('[Superhuman Linux] app.quit() called, isQuitting:', isQuitting);
    if (isQuitting) {
        originalQuit();
    } else {
        // console.log('[Superhuman Linux] Blocked quit attempt');
    }
};

// Prevent app from quitting when all windows are closed
app.on('window-all-closed', () => {
    // console.log('[Superhuman Linux] window-all-closed, isQuitting:', isQuitting);
    // Do nothing - don't quit
});

app.on('before-quit', (event) => {
    // console.log('[Superhuman Linux] before-quit, isQuitting:', isQuitting);
    if (!isQuitting) {
        event.preventDefault();
    }
});
app.on('activate', () => {
    const win = getVisibleWindow();
    if (win) showWindow(win);
});

// Initialize when app is ready
if (app.isReady()) {
    init();
} else {
    app.whenReady().then(init);
}

module.exports = { createTray, setupWindowCloseToTray, rebuildTrayMenu };
