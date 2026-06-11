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
#include <QProcess>
#include <QtDBus/QDBusAbstractAdaptor>
#include <QtDBus/QDBusConnection>
#include <QDateTime>

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
    app.setApplicationName("Lindora");
    app.setApplicationDisplayName("Lindora");
    app.setDesktopFileName("lindora");

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

    QAction *restartAction = trayMenu->addAction("Restart App");
QObject::connect(restartAction, &QAction::triggered, []() {
    QString program = QApplication::applicationFilePath();
    QStringList arguments = QApplication::arguments();
    
    // Remove the first argument, which is the executable path itself
    arguments.removeFirst(); 

    // Start a new instance
    QProcess::startDetached(program, arguments);
    
    // Quit the current instance
    QApplication::quit();
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

    // ⏱ TIMESTAMP ELEMENTS
    "  var elapsed = document.querySelector('[data-qa=\"elapsed_time\"]');"
    "  var remaining = document.querySelector('[data-qa=\"remaining_time\"]');"

    "  var song = text(track);"
    "  var artistName = text(artist);"

    "  var elapsedTime = elapsed ? elapsed.innerText.trim() : '';"
    "  var remainingTime = remaining ? remaining.innerText.trim() : '';"

    "  var result = '';"

    "  if (song && artistName) {"
    "    result = song + ' - ' + artistName;"
    "  }"

    "  if (!song && artistName) {"
    "    result = artistName;"
    "  }"

    "  if (song && !artistName) {"
    "    result = song;"
    "  }"

    "  if (elapsedTime || remainingTime) {"
    "    result += ' | ' + elapsedTime + ' / ' + remainingTime;"
    "  }"

    "  return result;"
    "})();";

    browser->page()->runJavaScript(scrapeJs, [trayIcon](const QVariant &v) {
        QString info = v.toString();
        if (!info.isEmpty()) {
            trayIcon->setToolTip(info);
        }
    });

});

timer->start(500);

// 1. Declare the action once
QAction *skipAction = trayMenu->addAction("Skip Song");

// 2. Define the trigger logic
QObject::connect(skipAction, &QAction::triggered, [browser]() {
    QString skipJs =
    "(function() {"
    ""
    "  let btn ="
    "      document.querySelector('[data-qa=\"t3_skip_forward_button\"]') ||"
    "      document.querySelector('[data-qa=\"skip_button\"]') ||"
    "      document.querySelector('.Tuner__Control__SkipForward__Button') ||"
    "      document.querySelector('.Tuner__Control__Skip__Button') ||"
    "      document.querySelector('[aria-label=\"Skip forwards\"]') ||"
    "      document.querySelector('[aria-label=\"skip forwards\"]');"
    ""
    "  if (!btn) {"
    "      const candidates = Array.from("
    "          document.querySelectorAll("
    "              'button,[role=\"button\"],div[role=\"button\"],span[role=\"button\"]'"
    "          )"
    "      );"
    ""
    "      btn = candidates.find(el => {"
    "          const aria = (el.getAttribute('aria-label') || '').toLowerCase();"
    "          const dataqa = (el.getAttribute('data-qa') || '').toLowerCase();"
    "          const cls = (el.className || '').toLowerCase();"
    ""
    "          return ("
    "              dataqa === 't3_skip_forward_button' ||"
    "              dataqa === 'skip_button' ||"
    "              aria === 'skip forwards' ||"
    "              aria === 'skip_forwards' ||"
    "              cls.includes('tuner__control__skipforward__button') ||"
    "              cls.includes('tuner__control__skip__button')"
    "          );"
    "      });"
    "  }"
    ""
    "  if (!btn) return 'NOT_FOUND';"
    "  if (btn.disabled) return 'DISABLED';"
    "  if (btn.getAttribute('aria-disabled') === 'true') return 'ARIA_DISABLED';"
    ""
    "  btn.focus();"
    "  btn.click();"
    ""
    "  btn.dispatchEvent(new MouseEvent('click', {"
    "      bubbles: true,"
    "      cancelable: true,"
    "      view: window"
    "  }));"
    ""
    "  return 'CLICKED';"
    ""
    "})();";

    browser->page()->runJavaScript(skipJs);
});

// 3. Single Visibility Connection
QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, skipAction]() {
    QString checkJs =
    "(function() {"
    "  function findBtn() {"
    "    const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "    return candidates.find(el => {"
    "      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "      const keywords = ['next', 'skip', 'forward', 'skip forward'];"
    "      return keywords.some(k => a.includes(k));"
    "    });"
    "  }"
    ""
    "  let btn = findBtn();"
    "  return !!(btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true');"
    "})();";

    browser->page()->runJavaScript(checkJs, [skipAction](const QVariant &res) {
        if (skipAction)
            skipAction->setVisible(res.toBool());
    });
});


QAction *prevAction = trayMenu->addAction("Previous Song");

QObject::connect(prevAction, &QAction::triggered, [browser]() {
    QString prevJs =
"(function() {"

"  const selectors = ["
"    '[data-qa=\"t3_skip_back_button\"]',"
"    '[aria-label=\"Skip backwards\"]',"
"    '[aria-label=\"skip_backwards\"]',"
"    '.Tuner__Control__SkipBack__Button'"
"  ];"

"  let btn = null;"

"  for (const s of selectors) {"
"    btn = document.querySelector(s);"
"    if (btn) break;"
"  }"

"  if (!btn) {"
"    const candidates = Array.from("
"      document.querySelectorAll('button,[role=\"button\"]')"
"    );"

"    btn = candidates.find(el => {"
"      const a = (el.getAttribute('aria-label') || '').toLowerCase();"
"      const d = (el.getAttribute('data-qa') || '').toLowerCase();"
"      const c = (el.className || '').toLowerCase();"

"      return ("
"        d.includes('skip_back_button') ||"
"        d.includes('skip_back') ||"
"        a.includes('skip_backwards') ||"
"        a.includes('skip backwards') ||"
"        c.includes('skipbackbutton') ||"
"        c.includes('skipback')"
"      );"
"    });"
"  }"

"  if (!btn)"
"    return 'NOT_FOUND';"

"  if (btn.disabled)"
"    return 'DISABLED';"

"  if (btn.getAttribute('aria-disabled') === 'true')"
"    return 'ARIA_DISABLED';"

"  btn.click();"

"  return 'CLICKED';"

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

QAction *replayAction = trayMenu->addAction("Replay");

QObject::connect(replayAction, &QAction::triggered, [browser]() {
    QString replayJs =
    "(function() {"
    "  let btn ="
    "      document.querySelector('[data-qa=\"replay_button\"]') ||"
    "      document.querySelector('.Tuner__Control__Replay__Button') ||"
    "      document.querySelector('[aria-label=\"Replay\"]');"
    ""
    "  if (!btn) {"
    "      const candidates = Array.from("
    "          document.querySelectorAll('button,[role=\"button\"],div[role=\"button\"],span[role=\"button\"]')"
    "      );"
    ""
    "      btn = candidates.find(el => {"
    "          const aria = (el.getAttribute('aria-label') || '').toLowerCase();"
    "          const dataqa = (el.getAttribute('data-qa') || '').toLowerCase();"
    "          const cls = (el.className || '').toLowerCase();"
    ""
    "          return ("
    "              dataqa === 'replay_button' ||"
    "              aria === 'replay' ||"
    "              cls.includes('replaybutton') ||"
    "              cls.includes('tuner__control__replay__button')"
    "          );"
    "      });"
    "  }"
    ""
    "  if (!btn) return;"
    "  if (btn.disabled) return;"
    "  if (btn.getAttribute('aria-disabled') === 'true') return;"
    ""
    "  btn.focus();"
    "  btn.click();"
    ""
    "  btn.dispatchEvent(new MouseEvent('click', {"
    "      bubbles: true,"
    "      cancelable: true,"
    "      view: window"
    "  }));"
    ""
    "})();";

    browser->page()->runJavaScript(replayJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow,
                 [browser, replayAction]() {

    QString replayCheckJs =
    "(function() {"
    "  const btn = document.querySelector('[data-qa=\"replay_button\"]');"
    ""
    "  return !!("
    "      btn &&"
    "      !btn.disabled &&"
    "      btn.getAttribute('aria-disabled') !== 'true'"
    "  );"
    "})();";

    browser->page()->runJavaScript(
        replayCheckJs,
        [replayAction](const QVariant &res) {
            if (replayAction)
                replayAction->setVisible(res.toBool());
        }
    );
});

QAction *repeatAction = trayMenu->addAction("Repeat");

QObject::connect(repeatAction, &QAction::triggered, [browser]() {
    QString repeatJs =
    "(function() {"
    "  const btn = document.querySelector('[data-qa=\"tuner_repeat_button\"]');"
    "  if (!btn) return;"
    "  if (btn.disabled) return;"
    "  if (btn.getAttribute('aria-disabled') === 'true') return;"
    "  btn.click();"
    "})();";

    browser->page()->runJavaScript(repeatJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow,
                 [browser, repeatAction]() {

    QString repeatStateJs =
    "(function() {"
    "  const btn = document.querySelector('[data-qa=\"tuner_repeat_button\"]');"
    ""
    "  if (!btn)"
    "    return { exists: false };"
    ""
    "  return {"
    "    exists: true,"
    "    checked: btn.getAttribute('aria-checked') || ''"
    "  };"
    "})();";

    browser->page()->runJavaScript(
        repeatStateJs,
        [repeatAction](const QVariant &res) {

            QVariantMap info = res.toMap();

            bool exists = info.value("exists").toBool();

            repeatAction->setVisible(exists);

            if (!exists)
                return;

            QString checked = info.value("checked").toString();

            if (checked == "false")
                repeatAction->setText("Repeat: Off");
            else if (checked == "true")
                repeatAction->setText("Repeat: Playlist");
            else if (checked == "mixed")
                repeatAction->setText("Repeat: Song");
            else
                repeatAction->setText("Repeat");
        }
    );
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
    "    const rect = btn.getBoundingClientRect();"
    "    const x = rect.left + rect.width / 2;"
    "    const y = rect.top + rect.height / 2;"
    "    const opts = { bubbles: true, cancelable: true, view: window, clientX: x, clientY: y };"
    "    btn.dispatchEvent(new PointerEvent('pointerdown', { ...opts, pointerId: 1, isPrimary: true }));"
    "    btn.dispatchEvent(new MouseEvent('mousedown', opts));"
    "    btn.dispatchEvent(new PointerEvent('pointerup', { ...opts, pointerId: 1, isPrimary: true }));"
    "    btn.dispatchEvent(new MouseEvent('mouseup', opts));"
    "    btn.dispatchEvent(new MouseEvent('click', opts));"
    "    if (typeof btn.click === 'function') btn.click();"
    "  }"
    "})();";
    browser->page()->runJavaScript(pauseJs);
});

QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, pauseAction]() {
    QString checkJs =
    "(function() {"
    "  if (document.querySelector('[data-qa=\"pause_button\"]'))"
    "    return 'PAUSE';"
    ""
    "  if (document.querySelector('[data-qa=\"play_button\"]'))"
    "    return 'PLAY';"
    ""
    "  return 'UNKNOWN';"
    "})();";

    browser->page()->runJavaScript(checkJs, [pauseAction](const QVariant &res) {
        QString state = res.toString();

        if (state == "PAUSE")
            pauseAction->setText("Pause");
        else if (state == "PLAY")
            pauseAction->setText("Play");
        else
            pauseAction->setText("Play/Pause");
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

QObject::connect(trayMenu, &QMenu::aboutToShow,
                 [browser, thumbUpAction]() {

    QString checkJs =
    "(function() {"
    "  const btn = document.querySelector('[data-qa=\"thumbs_up_button\"]');"
    "  if (!btn) return 'UNKNOWN';"
    ""
    "  return btn.getAttribute('aria-checked') === 'true'"
    "      ? 'ON'"
    "      : 'OFF';"
    "})();";

    browser->page()->runJavaScript(
        checkJs,
        [thumbUpAction](const QVariant &res) {

            QString state = res.toString();

            if (state == "ON")
                thumbUpAction->setText("Thumbs Up: On");
            else if (state == "OFF")
                thumbUpAction->setText("Thumbs Up: Off");
            else
                thumbUpAction->setText("Thumbs Up");
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

QAction *shuffleAction = trayMenu->addAction("Shuffle");
QObject::connect(shuffleAction, &QAction::triggered, [browser]() {
    QString shuffleJs =
    "(function() {"
    "  const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "  const btn = candidates.find(el => {"
    "    const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "    const t = (el.innerText || '').toLowerCase();"
    "    return a.includes('shuffle') || t.includes('shuffle');"
    "  });"
    ""
    "  if (btn) {"
    "    btn.dispatchEvent(new MouseEvent('click', { bubbles: true, cancelable: true, view: window }));"
    "    btn.click();"
    "  }"
    "})();";
    browser->page()->runJavaScript(shuffleJs);
});

// Optional: Keep the visibility synced if you want it to appear only when available
QObject::connect(trayMenu, &QMenu::aboutToShow, [browser, shuffleAction]() {
    QString checkJs =
    "(function() {"
    "  const candidates = Array.from(document.querySelectorAll('button, div[role=\"button\"], span[role=\"button\"]'));"
    "  const btn = candidates.find(el => {"
    "    const a = (el.getAttribute('aria-label') || '').toLowerCase();"
    "    return a.includes('shuffle');"
    "  });"
    "  return !!(btn && !btn.disabled && btn.getAttribute('aria-disabled') !== 'true');"
    "})();";

    browser->page()->runJavaScript(checkJs, [shuffleAction](const QVariant &res) {
        shuffleAction->setVisible(res.toBool());
    });
});

// --- MPRIS INTEGRATION (NO MOC REQUIRED) ---
QDBusConnection mprisConn = QDBusConnection::sessionBus();
if (mprisConn.registerService("org.mpris.MediaPlayer2.lindora")) {
    QObject *mprisObj = new QObject(&window);
    mprisConn.registerObject("/org/mpris/MediaPlayer2", mprisObj, QDBusConnection::ExportAdaptors);

    // Create a local bridge to call your existing actions
    QObject *bridge = new QObject(&window);
    
    // Connect D-Bus signals directly to existing actions
    // This assumes your QActions have slots named "trigger()" (which they do)
    mprisConn.connect("org.mpris.MediaPlayer2", "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player", "PlayPause", pauseAction, SLOT(trigger()));
    mprisConn.connect("org.mpris.MediaPlayer2", "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player", "Next", skipAction, SLOT(trigger()));
    mprisConn.connect("org.mpris.MediaPlayer2", "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player", "Previous", prevAction, SLOT(trigger()));
}

    window.show();
    return app.exec();
}
