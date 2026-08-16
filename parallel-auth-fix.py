import re

with open('src/auth/Auth.cpp', 'r') as f:
    content = f.read()
content = content.replace('waitForFinished(5000)', 'waitForFinished(300)')
with open('src/auth/Auth.cpp', 'w') as f:
    f.write(content)

with open('src/daemon/Display.h', 'r') as f:
    content = f.read()
content = content.replace(
    'bool m_started { false };',
    'bool m_started { false };\n        bool m_fingerprintAuthActive { false };\n        QString m_lastAttemptedUser;'
)
content = content.replace(
    '        bool startAuth(const QString &user, const QString &password,\n                       const Session &session);',
    '        bool startAuth(const QString &user, const QString &password,\n                       const Session &session);\n        void onGreeterConnected();'
)
with open('src/daemon/Display.h', 'w') as f:
    f.write(content)

with open('src/daemon/SocketServer.h', 'r') as f:
    content = f.read()
content = content.replace(
    '        void login(QLocalSocket *socket,\n                   const QString &user, const QString &password,\n                   const Session &session);',
    '        void login(QLocalSocket *socket,\n                   const QString &user, const QString &password,\n                   const Session &session);\n        void greeterConnected();'
)
with open('src/daemon/SocketServer.h', 'w') as f:
    f.write(content)

with open('src/daemon/SocketServer.cpp', 'r') as f:
    content = f.read()
content = content.replace(
    '                    // emit signal\n                }\n                break;\n                case GreeterMessages::Login:',
    '                    // emit signal\n                    emit greeterConnected();\n                }\n                break;\n                case GreeterMessages::Login:'
)
with open('src/daemon/SocketServer.cpp', 'w') as f:
    f.write(content)

with open('src/daemon/Display.cpp', 'r') as f:
    content = f.read()

content = content.replace(
    '        connect(m_socketServer, &SocketServer::login, this, &Display::login);',
    '        connect(m_socketServer, &SocketServer::login, this, &Display::login);\n        connect(m_socketServer, &SocketServer::greeterConnected, this, &Display::onGreeterConnected);'
)

content = content.replace(
    '    void Display::login(QLocalSocket *socket,\n                        const QString &user, const QString &password,\n                        const Session &session) {\n        m_socket = socket;',
    '    void Display::login(QLocalSocket *socket,\n                        const QString &user, const QString &password,\n                        const Session &session) {\n        m_socket = socket;\n        if (!user.isEmpty()) m_lastAttemptedUser = user;'
)

content = content.replace(
    '        if(password.isEmpty() && !m_auth->fingerprintlogin()){\n            qDebug() << "use fingerprint because password is empty";\n            m_auth->setFingerprintlogin(true);\n        }',
    '        if(password.isEmpty() && !m_auth->fingerprintlogin()){\n            qDebug() << "use fingerprint because password is empty";\n            m_auth->setFingerprintlogin(true);\n        }\n'
)

content = content.replace(
    '        if (m_auth->isActive()) {\n            qWarning() << "Existing authentication ongoing, aborting";\n            return false;\n        }',
    '        if (m_auth->isActive()) {\n            if (m_fingerprintAuthActive) {\n                qDebug() << "Stopping fingerprint auth to allow password auth";\n                m_auth->stop();\n                m_fingerprintAuthActive = false;\n            } else {\n                qWarning() << "Existing authentication ongoing, aborting";\n                return false;\n            }\n        }'
)

content = content.replace(
    '    void Display::slotAuthenticationFinished(const QString &user, bool success) {\n        if (m_auth->autologin() && !success) {',
    '    void Display::slotAuthenticationFinished(const QString &user, bool success) {\n        m_fingerprintAuthActive = false;\n        if (!success && !m_auth->autologin() && !m_auth->fingerprintlogin()) { QTimer::singleShot(300, this, &Display::onGreeterConnected); }\n        if (m_auth->autologin() && !success) {'
)

# Add onGreeterConnected function
content = content.replace(
    '    QString Display::findGreeterTheme() const {',
    '''    void Display::onGreeterConnected() {
        QString lastUser = m_lastAttemptedUser.isEmpty() ? stateConfig.Last.User.get() : m_lastAttemptedUser;
        if (lastUser.isEmpty() || lastUser == QLatin1String("sddm"))
            return;

        if (m_auth->isActive())
            return;

        QString lastSession = stateConfig.Last.Session.get();
        Session::Type sessionType = Session::X11Session;

        if (findSessionEntry(mainConfig.Wayland.SessionDir.get(), lastSession))
            sessionType = Session::WaylandSession;
        else if (findSessionEntry(mainConfig.X11.SessionDir.get(), lastSession))
            sessionType = Session::X11Session;
        else
            return;

        Session session;
        session.setTo(sessionType, lastSession);

        qDebug() << "Starting fingerprint auth for user:" << lastUser;
        m_auth->setFingerprintlogin(true);
        m_fingerprintAuthActive = true;
        startAuth(lastUser, QString(), session);
        m_auth->setFingerprintlogin(false);
    }

    QString Display::findGreeterTheme() const {'''
)

with open('src/daemon/Display.cpp', 'w') as f:
    f.write(content)

print("Parallel auth fix applied.")

with open('src/auth/Auth.cpp', 'r') as f:
    content = f.read()

content = content.replace(
    "        bool fingerprintlogin { false };",
    "        bool fingerprintlogin { false };\n        bool stoppedIntentionally { false };"
)

content = content.replace(
    '''    void Auth::Private::childExited(int exitCode, QProcess::ExitStatus exitStatus) {
        if (exitStatus != QProcess::NormalExit) {
            qWarning("Auth: sddm-helper (%s) crashed (exit code %d)",
                     qPrintable(child->arguments().join(QLatin1Char(' '))),
                     HelperExitStatus(exitStatus));
            Q_EMIT qobject_cast<Auth*>(parent())->error(child->errorString(), ERROR_INTERNAL);
        }''',
    '''    void Auth::Private::childExited(int exitCode, QProcess::ExitStatus exitStatus) {
        if (exitStatus != QProcess::NormalExit && !stoppedIntentionally) {
            qWarning("Auth: sddm-helper (%s) crashed (exit code %d)",
                     qPrintable(child->arguments().join(QLatin1Char(' '))),
                     HelperExitStatus(exitStatus));
            Q_EMIT qobject_cast<Auth*>(parent())->error(child->errorString(), ERROR_INTERNAL);
        }
        stoppedIntentionally = false;'''
)

content = content.replace(
    '''    void Auth::stop() {
        if (d->child->state() == QProcess::NotRunning) {
            return;
        }

        d->child->terminate();

        // wait for finished
        if (!d->child->waitForFinished(300))
            d->child->kill();
    }''',
    '''    void Auth::stop() {
        if (d->child->state() == QProcess::NotRunning) {
            return;
        }

        d->stoppedIntentionally = true;
        d->child->terminate();

        // wait for finished
        if (!d->child->waitForFinished(300))
            d->child->kill();
    }'''
)

with open('src/auth/Auth.cpp', 'w') as f:
    f.write(content)

print("Crash suppression fix applied.")
