#include <QApplication>
#include <QMainWindow>
#include <QWebEngineView>
#include <QWebEnginePage>
#include <QWebEngineProfile>
#include <QWebEngineSettings>
#include <QWebEngineScript>
#include <QWebEngineScriptCollection>
#include <QUrl>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QIcon>
#include <QCloseEvent>
#include <QRegularExpression>
#include <QTimer>
#include <thread>
#include <QDir>
#include <QSvgRenderer>
#include <QPixmap>
#include <QPainter>

// Custom window class to intercept close events and hide to tray natively
class LindoraWindow : public QMainWindow {
protected:
    void closeEvent(QCloseEvent *event) override {
        if (isVisible()) {
            event->ignore(); // Stop the window from actually destroying itself
            hide();          // Simply hide it from view
        }
    }
};

int main(int argc, char *argv[]) {
    qputenv("QTWEBENGINE_REMOTE_DEBUGGING", "9222");
    qputenv("QT_QPA_PLATFORM", "xcb");

    QApplication app(argc, argv);

    // MUST be before any window is created/mapped
    app.setApplicationName("lindora-native");
    app.setApplicationDisplayName("Lindora");
    app.setDesktopFileName("lindora-native");

    QIcon appIcon("/usr/share/icons/hicolor/scalable/apps/lindora.svg");
    app.setWindowIcon(appIcon);

    LindoraWindow window;
    window.setWindowIcon(appIcon);
    window.setWindowTitle("Lindora");
    window.setObjectName("lindora-native");
    window.resize(1100, 750);

    app.setQuitOnLastWindowClosed(false);

    // Maintain persistent profile so your login session remains saved
    QWebEngineProfile *profile = new QWebEngineProfile("lindora-native", &app);
    profile->setPersistentStoragePath(profile->persistentStoragePath());
    profile->setPersistentCookiesPolicy(QWebEngineProfile::ForcePersistentCookies);

    // Set dark mode configuration directly on the profile settings to invert standard text
    profile->settings()->setAttribute(QWebEngineSettings::ForceDarkMode, true);

QString customCss = 
    /* 1. Universal "Catch-All": Deep Blue background (#001a33) */
    "*:not(img):not([class*='art']):not([class*='Art']):not([class*='thumb']):not([class*='Thumb']):not(.Image__img) { "
    "  background-color: #001224 !important; "
    "  background-image: none !important; "
    "} "

    /* 2. UI Layer: Deep Purple panels (#1f0022) */
    ":root { --panel-purple: #1f0022; --text-color: #ffffff; } "
    ".nowPlayingTopInfo, .sidebar, .root-container { "
    "  background-color: var(--panel-purple) !important; "
    "} "

    /* 4. Buttons: Inherit background from their parent panel */
    "button, [role='button'] { "
    "  background-color: inherit !important; " 
    "  border: 1px solid #5c1b4b !important; " /* Subtle border for visibility */
    "  color: var(--text-color) !important; "
    "} "

    /* 5. Cleanup & Text */
    "h1, h2, h3, p, span, div, a { color: var(--text-color) !important; } "
    "::-webkit-scrollbar { width: 8px !important; } "
    "::-webkit-scrollbar-thumb { background: #5c1b4b !important; } "
    "::-webkit-scrollbar-track { background: #001a33 !important; }";

    QString jsCode = QString(
        "(function() {"
        "  var style = document.createElement('style');"
        "  style.type = 'text/css';"
        "  style.appendChild(document.createTextNode(`%1`));"
        "  document.head.appendChild(style);"
        "  var observer = new MutationObserver(function(mutations) {"
        "    if (!document.head.contains(style)) {"
        "      document.head.appendChild(style);"
        "    }"
        "  });"
        "  observer.observe(document.documentElement, {childList: true, subtree: true});"
        "})();"
    ).arg(customCss);

    QWebEngineScript script;
    script.setName("PlumCanvasTheme");
    script.setSourceCode(jsCode);
    script.setInjectionPoint(QWebEngineScript::DocumentReady);
    script.setRunsOnSubFrames(true);

    profile->scripts()->insert(script);

    QWebEnginePage *page = new QWebEnginePage(profile, &window);
    QWebEngineView *browser = new QWebEngineView(&window);
    browser->setPage(page);
    window.setCentralWidget(browser);

    // Load the official site directly
    browser->setUrl(QUrl("https://www.pandora.com"));

QString iconPath = "/usr/share/icons/hicolor/scalable/apps/lindora.svg";

// Rasterize the SVG to a 64x64 pixmap for the tray
QPixmap pixmap(64, 64);
pixmap.fill(Qt::transparent);
QSvgRenderer renderer(iconPath);
QPainter painter(&pixmap);
renderer.render(&painter);
painter.end();

QIcon trayIconImage(pixmap);
QSystemTrayIcon *trayIcon = new QSystemTrayIcon(trayIconImage, &window);
    QMenu *trayMenu = new QMenu(&window);
    
    // Add a "Show" option to the right-click menu
    QAction *restoreAction = trayMenu->addAction("Show Lindora");
    QObject::connect(restoreAction, &QAction::triggered, [&window]() {
        window.show();
        window.raise();
        window.activateWindow();
    });

    // Add an "Exit" option to completely kill the background process
    QAction *quitAction = trayMenu->addAction("Exit");
    QObject::connect(quitAction, &QAction::triggered, [&app]() {
        app.quit(); 
    });

    trayIcon->setIcon(trayIconImage);

    trayIcon->setContextMenu(trayMenu);
// ... inside main() after trayIcon initialization ...

QTimer *timer = new QTimer(&window);
QObject::connect(timer, &QTimer::timeout, [browser, trayIcon]() {
    QString scrapeJs =
    "(function() {"
    "  function text(el) {"
    "    return el ? el.innerText.trim() : '';"
    "  }"

    "  var track = "
"    document.querySelector('[data-qa=\"mini_track_title\"]') || "
"    document.querySelector('[data-qa=\"track_name\"]') || "
"    document.querySelector('.Marquee__wrapper__content');"

"  var artist = "
"    document.querySelector('[data-qa=\"mini_track_artist\"]') || "
"    document.querySelector('[data-qa=\"artist_name\"]') || "
"    document.querySelector('[data-qa=\"artistName\"]') || "
"    document.querySelector('[data-qa=\"now_playing_artist\"]') || "
"    document.querySelector('[data-qa=\"mini_player\"] [data-qa*=\"artist\"]') || "
"    document.querySelector('[class*=\"artist\"]') || "
"    document.querySelector('[class*=\"Artist\"]') || "
"    document.querySelector('.nowPlayingTopInfo__current__artist') || "
"    document.querySelector('.Marquee__wrapper__content') || "
"    document.querySelector('.Marquee__wrapper__content + div') || "
"    document.querySelector('a[href*=\"/artist/\"]') || "
"    document.querySelector('span[aria-label*=\"artist\"]') || "
"    document.querySelector('div[aria-label*=\"artist\"]') || "
"    document.querySelector('[role=\"link\"][href*=\"artist\"]') || "
"    document.querySelector('div[data-automation*=\"artist\"]') || "
"    document.querySelector('span[data-automation*=\"artist\"]') || "
"    document.querySelector('div[data-test*=\"artist\"]') || "
"    document.querySelector('span[data-test*=\"artist\"]') || "
"    document.querySelector('meta[property=\"music:musician\"]') || "
"    null;"

    "  var song = text(track);"
    "  var artistName = text(artist);"

    "  if (song && artistName) {"
    "    return song + ' - ' + artistName;"
    "  }"

    "  if (song) {"
    "    return song;"
    "  }"

    "  return '';"
    "})();";
        
    browser->page()->runJavaScript(scrapeJs, [trayIcon](const QVariant &v) {
        QString info = v.toString();
        if (!info.isEmpty()) {
            trayIcon->setToolTip(info);
        }
    });
});
timer->start(3000);

QAction *skipAction = trayMenu->addAction("Skip Song");
QObject::connect(skipAction, &QAction::triggered, [browser]() {

    QString skipJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    ""
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    ""
    "      return ("
    "        a.includes('skip') ||"
    "        a.includes('next') ||"
    "        a.includes('forward') ||"
    "        t.includes('skip') ||"
    "        t.includes('next') ||"
    "        c.includes('skip') ||"
    "        c.includes('next')"
    "      );"
    "    });"
    "  }"
    ""
    "  let btn = findBtn();"
    ""
    "  if (!btn) {"
    "    const all = document.querySelectorAll('*');"
    "    for (let el of all) {"
    "      const a = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();"
    "      if (a.includes('next') || a.includes('skip')) {"
    "        btn = el;"
    "        break;"
    "      }"
    "    }"
    "  }"
    ""
    "  if (btn) {"
    "    btn.dispatchEvent(new MouseEvent('click', {"
    "      bubbles: true,"
    "      cancelable: true,"
    "      view: window"
    "    }));"
    "    btn.click();"
    "  }"
    ""
    "})();";

    browser->page()->runJavaScript(skipJs);
});

// This connection keeps your visibility logic tied to the tray menu's state 
// without altering your skipAction creation block above.
QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, skipAction]() {
    QString checkJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    "      return a.includes('skip') || a.includes('next') || a.includes('forward') || t.includes('skip') || t.includes('next') || c.includes('skip') || c.includes('next');"
    "    });"
    "  }"
    "  let btn = findBtn();"
    "  return !!(btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true');"
    "})();";

    browser->page()->runJavaScript(checkJs, [skipAction](const QVariant &res) {
        skipAction->setVisible(res.toBool());
    });
});

QAction *prevAction = trayMenu->addAction("Previous Song");
QObject::connect(prevAction, &QAction::triggered, [browser]() {

    QString prevJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    ""
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    ""
    "      return ("
    "        a.includes('previous') ||"
    "        a.includes('back') ||"
    "        a.includes('rewind') ||"
    "        t.includes('previous') ||"
    "        t.includes('back') ||"
    "        c.includes('previous') ||"
    "        c.includes('back')"
    "      );"
    "    });"
    "  }"
    ""
    "  let btn = findBtn();"
    ""
    "  if (!btn) {"
    "    const all = document.querySelectorAll('*');"
    "    for (let el of all) {"
    "      const a = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();"
    "      if (a.includes('previous') || a.includes('back')) {"
    "        btn = el;"
    "        break;"
    "      }"
    "    }"
    "  }"
    ""
    "  if (btn) {"
    "    btn.dispatchEvent(new MouseEvent('click', {"
    "      bubbles: true,"
    "      cancelable: true,"
    "      view: window"
    "    }));"
    "    btn.click();"
    "  }"
    ""
    "})();";

    browser->page()->runJavaScript(prevJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, prevAction]() {

    QString checkJs =
    "(function() {"
    "  function isVisible(el) {"
    "    if (!el) return false;"
    "    const style = window.getComputedStyle(el);"
    "    return style && style.display !== 'none' && style.visibility !== 'hidden' && el.offsetParent !== null;"
    "  }"
    ""
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    ""
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    ""
    "      const match = ("
    "        a.includes('previous') ||"
    "        a.includes('back') ||"
    "        a.includes('rewind') ||"
    "        t.includes('previous') ||"
    "        t.includes('back') ||"
    "        c.includes('previous') ||"
    "        c.includes('back')"
    "      );"
    ""
    "      return match && isVisible(el);"
    "    });"
    "  }"
    ""
    "  let btn = findBtn();"
    ""
    "  if (!btn) {"
    "    const all = document.querySelectorAll('button, div[role=\"button\"]');"
    "    for (let el of all) {"
    "      const a = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();"
    "      if ((a.includes('previous') || a.includes('back')) && el.offsetParent !== null) {"
    "        btn = el;"
    "        break;"
    "      }"
    "    }"
    "  }"
    ""
    "  return !!btn;"
    "})();";

    browser->page()->runJavaScript(checkJs, [prevAction](const QVariant &res) {
        prevAction->setVisible(res.toBool());
    });
});

// Add a Pause/Play option to the right-click menu
QAction *pauseAction = trayMenu->addAction("Pause/Play");
QObject::connect(pauseAction, &QAction::triggered, [browser]() {
    QString pauseJs =
    "(function() {"
"  var btn = document.querySelector('[data-qa=\"play_pause_button\"]') || "
"            document.querySelector('[data-qa=\"play_button\"]') || "
"            document.querySelector('[data-qa=\"pause_button\"]');"

"  if (btn) {"
"    btn.dispatchEvent(new MouseEvent('click', { bubbles: true, cancelable: true, view: window }));"
"  }"
"})();";
    browser->page()->runJavaScript(pauseJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, pauseAction]() {
    QString checkJs =
    "(function() {"
    "  const pauseBtn = document.querySelector('[data-qa=\"pause_button\"]');"
    "  // If the pause button exists and is visible, we are currently playing"
    "  const isPlaying = pauseBtn && (pauseBtn.offsetParent !== null);"
    "  return isPlaying ? 'PAUSE' : 'PLAY';"
    "})();";

    browser->page()->runJavaScript(checkJs, [pauseAction](const QVariant &res) {
        QString state = res.toString();
        pauseAction->setText(state == "PAUSE" ? "Pause" : "Play");
        // You could also update an icon here if you use one
    });
});

    trayIcon->show();

    // Toggle window visibility when clicking the system tray icon directly
    QObject::connect(trayIcon, &QSystemTrayIcon::activated, [&window](QSystemTrayIcon::ActivationReason reason) {
        if (reason == QSystemTrayIcon::Trigger) {
            if (window.isVisible()) {
                window.hide();
            } else {
                window.show();
                window.raise();
                window.activateWindow();
            }
        }
    });

QAction *thumbUpAction = trayMenu->addAction("Thumbs Up");
QObject::connect(thumbUpAction, &QAction::triggered, [browser]() {

    QString thumbUpJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    ""
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    ""
    // Added explicit check: skip if it looks like a dislike button
    "      const isDislike = a.includes('dislike') || a.includes('thumb down') || t.includes('dislike');"
    ""
    "      return ("
    "        (a.includes('like') || a.includes('thumb up') || t.includes('like')) && !isDislike"
    "      );"
    "    });"
    "  }"
    ""
    "  let btn = findBtn();"
    ""
    "  if (!btn) {"
    "    const all = document.querySelectorAll('*');"
    "    for (let el of all) {"
    "      const a = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();"
    "      if ((a.includes('like') || a.includes('thumb up')) && !a.includes('dislike')) {"
    "        btn = el;"
    "        break;"
    "      }"
    "    }"
    "  }"
    ""
    "  if (btn) {"
    "    btn.dispatchEvent(new MouseEvent('click', {"
    "      bubbles: true,"
    "      cancelable: true,"
    "      view: window"
    "    }));"
    "    btn.click();"
    "  }"
    ""
    "})();";

    browser->page()->runJavaScript(thumbUpJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, thumbUpAction]() {
    QString checkJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    "      const isDislike = a.includes('dislike') || a.includes('thumb down') || t.includes('dislike');"
    "      return (a.includes('like') || a.includes('thumb up') || t.includes('like')) && !isDislike;"
    "    });"
    "  }"
    "  let btn = findBtn();"
    "  return !!(btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true');"
    "})();";

    browser->page()->runJavaScript(checkJs, [thumbUpAction](const QVariant &res) {
        thumbUpAction->setVisible(res.toBool());
    });
});

QAction *thumbDownAction = trayMenu->addAction("Thumbs Down");
QObject::connect(thumbDownAction, &QAction::triggered, [browser]() {

    QString thumbDownJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    ""
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    ""
    "      return ("
    "        a.includes('thumb down') ||"
    "        a.includes('dislike') ||"
    "        t.includes('thumb down') ||"
    "        t.includes('dislike') ||"
    "        c.includes('dislike')"
    "      );"
    "    });"
    "  }"
    ""
    "  let btn = findBtn();"
    ""
    "  if (!btn) {"
    "    const all = document.querySelectorAll('*');"
    "    for (let el of all) {"
    "      const a = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();"
    "      if (a.includes('dislike') || a.includes('thumb down')) {"
    "        btn = el;"
    "        break;"
    "      }"
    "    }"
    "  }"
    ""
    "  if (btn) {"
    "    btn.dispatchEvent(new MouseEvent('click', {"
    "      bubbles: true,"
    "      cancelable: true,"
    "      view: window"
    "    }));"
    "    btn.click();"
    "  }"
    ""
    "})();";

    browser->page()->runJavaScript(thumbDownJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, thumbDownAction]() {
    QString checkJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    "      return a.includes('thumb down') || a.includes('dislike') || t.includes('thumb down') || t.includes('dislike') || c.includes('dislike');"
    "    });"
    "  }"
    "  let btn = findBtn();"
    "  return !!(btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true');"
    "})();";

    browser->page()->runJavaScript(checkJs, [thumbDownAction](const QVariant &res) {
        thumbDownAction->setVisible(res.toBool());
    });
});

// 1. Create the Replay action
QAction *replayAction = trayMenu->addAction("Replay Song");

// 2. Trigger Logic
QObject::connect(replayAction, &QAction::triggered, [browser]() {
    QString replayJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    "      return a.includes('replay') || t.includes('replay') || c.includes('replay');"
    "    });"
    "  }"
    "  let btn = findBtn();"
    "  if (!btn) {"
    "    const all = document.querySelectorAll('*');"
    "    for (let el of all) {"
    "      const a = (el.getAttribute && el.getAttribute('aria-label') || '').toLowerCase();"
    "      if (a.includes('replay')) { btn = el; break; }"
    "    }"
    "  }"
    "  if (btn) { btn.dispatchEvent(new MouseEvent('click', { bubbles: true, cancelable: true, view: window })); btn.click(); }"
    "})();";
    browser->page()->runJavaScript(replayJs);
});

// 3. Visibility Logic (Missing from your original duplicate)
QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, replayAction]() {
    QString checkJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const t = (el.innerText || '').toLowerCase();"
    "      const c = (el.className || '').toLowerCase();"
    "      return a.includes('replay') || t.includes('replay') || c.includes('replay');"
    "    });"
    "  }"
    "  let btn = findBtn();"
    "  return !!(btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true');"
    "})();";
    browser->page()->runJavaScript(checkJs, [replayAction](const QVariant &res) {
        replayAction->setVisible(res.toBool());
    });
});

    window.show();
    return app.exec();
}
