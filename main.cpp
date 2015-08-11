/*****************************************************************

Copyright (C) 2009 Lubos Lunak <l.lunak@suse.cz>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

******************************************************************/

#include "main.h"

#include <cassert>
#include <unistd.h>

#include <QtCore/QCommandLineParser>
#include <QtCore/QMimeDatabase>
#include <QtGui/QIcon>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFileDialog>

#include <KConfigCore/KConfigGroup>
#include <KConfigCore/KSharedConfig>
#include <KCoreAddons/KAboutData>
#include <KCoreAddons/KShell>
#include <KCoreAddons/KProcess>
#include <KI18n/KLocalizedString>
#include <KIOCore/KProtocolManager>
#include <KIOCore/KRecentDocument>
#include <KIOWidgets/KOpenWithDialog>
#include <KIOWidgets/KRun>
#include <KNotifications/KNotification>
#include <KService/KMimeTypeTrader>
#include <KWindowSystem/KWindowSystem>

//#define DEBUG_KDE

#define HELPER_VERSION 6
#define APP_HELPER_VERSION "0.6.4"

int main( int argc, char* argv[] )
    {
    QApplication app(argc, argv);

    KAboutData about( "kmozillahelper", i18n( "KMozillaHelper" ), APP_HELPER_VERSION );
    KAboutData::setApplicationData(about);
    QApplication::setWindowIcon(QIcon::fromTheme(QLatin1String("firefox"))); // TODO: what about other mozilla apps?

    QCommandLineParser parser;
    about.setupCommandLine(&parser);

    app.setQuitOnLastWindowClosed(false);

    Helper helper;

    return app.exec();
    }

Helper::Helper()
    : input( stdin )
    , output( stdout )
    , notifier( STDIN_FILENO, QSocketNotifier::Read )
    , arguments_read( false )
    {
    connect( &notifier, SIGNAL( activated( int )), SLOT( readCommand()));
    //setQuitOnLastWindowClosed( false );
    }

void Helper::readCommand()
    {
    QString command = readLine();
    if( input.atEnd())
        {
#ifdef DEBUG_KDE
        QTextStream( stderr ) << "EOF, existing." << endl;
#endif
        QCoreApplication::exit();
        return;
        }
#ifdef DEBUG_KDE
    QTextStream( stderr ) << "COMMAND:" << command << endl;
#endif
    bool status;
    if( command == "CHECK" )
        status = handleCheck();
    else if( command == "GETPROXY" )
        status = handleGetProxy();
    else if( command == "HANDLEREXISTS" )
        status = handleHandlerExists();
    else if( command == "GETFROMEXTENSION" )
        status = handleGetFromExtension();
    else if( command == "GETFROMTYPE" )
        status = handleGetFromType();
    else if( command == "GETAPPDESCFORSCHEME" )
        status = handleGetAppDescForScheme();
    else if( command == "APPSDIALOG" )
        status = handleAppsDialog();
    else if( command == "GETOPENFILENAME" )
        status = handleGetOpenX( false );
    else if( command == "GETOPENURL" )
        status = handleGetOpenX( true );
    else if( command == "GETSAVEFILENAME" )
        status = handleGetSaveX( false );
    else if( command == "GETSAVEURL" )
        status = handleGetSaveX( true );
    else if( command == "GETDIRECTORYFILENAME" )
        status = handleGetDirectoryX( false );
    else if( command == "GETDIRECTORYURL" )
        status = handleGetDirectoryX( true );
    else if( command == "OPEN" )
        status = handleOpen();
    else if( command == "REVEAL" )
        status = handleReveal();
    else if( command == "RUN" )
        status = handleRun();
    else if( command == "GETDEFAULTFEEDREADER" )
        status = handleGetDefaultFeedReader();
    else if( command == "OPENMAIL" )
        status = handleOpenMail();
    else if( command == "OPENNEWS" )
        status = handleOpenNews();
    else if( command == "ISDEFAULTBROWSER" )
        status = handleIsDefaultBrowser();
    else if( command == "SETDEFAULTBROWSER" )
        status = handleSetDefaultBrowser();
    else if( command == "DOWNLOADFINISHED" )
        status = handleDownloadFinished();
    else
        {
        QTextStream( stderr ) << "Unknown command for KDE helper: " << command << endl;
        status = false;
        }
    // status done as \1 (==ok) and \0 (==not ok), because otherwise this cannot happen
    // in normal data (\ is escaped otherwise)
    outputLine( status ? "\\1" : "\\0", false ); // do not escape
    }

bool Helper::handleCheck()
    {
    if( !readArguments( 1 ))
        return false;
    int version = getArgument().toInt(); // requested version
    if( !allArgumentsUsed())
        return false;
    if( version <= HELPER_VERSION ) // we must have the exact requested version
        return true;
    QTextStream( stderr ) << "KDE helper version too old." << endl;
    return false;
    }

bool Helper::handleGetProxy()
    {
    if( !readArguments( 1 ))
        return false;
    QUrl url = QUrl::fromUserInput( getArgument());
    if( !allArgumentsUsed())
        return false;
    QString proxy;
    KProtocolManager::slaveProtocol( url, proxy ); 
    if( proxy.isEmpty() || proxy == "DIRECT" ) // TODO return DIRECT if empty?
        {
        outputLine( "DIRECT" );
        return true;
        }
    QUrl proxyurl = QUrl::fromUserInput( proxy );
    if( proxyurl.isValid())
        { // firefox wants this format
        outputLine( "PROXY" " " + proxyurl.host() + ":" + QString::number( proxyurl.port()));
        // TODO there is also "SOCKS " type
        return true;
        }
    return false;
    }

bool Helper::handleHandlerExists()
    {
    if( !readArguments( 1 ))
        return false;
    QString protocol = getArgument();
    if( !allArgumentsUsed())
        return false;
    return KProtocolInfo::isKnownProtocol( protocol );
    }

bool Helper::handleGetFromExtension()
    {
    if( !readArguments( 1 ))
        return false;
    QString ext = getArgument();
    if( !allArgumentsUsed())
        return false;
    if( !ext.isEmpty()) {
        QList<QMimeType> mimeList = QMimeDatabase().mimeTypesForFileName("foo." + ext);
        for (const QMimeType &mime : mimeList)
            if (mime.isValid() && writeMimeInfo(mime))
                return true;
        return false;
    }
    return false;
    }

bool Helper::handleGetFromType()
    {
    if( !readArguments( 1 ))
        return false;
    QString type = getArgument();
    if( !allArgumentsUsed())
        return false;
    QMimeType mime = QMimeDatabase().mimeTypeForName(type);
    if (mime.isValid()) return writeMimeInfo(mime);
    // firefox also asks for protocol handlers using getfromtype
    QString app = getAppForProtocol( type );
    if( !app.isEmpty())
        {
        outputLine( type );
        outputLine( type ); // TODO probably no way to find a good description
        outputLine( app );
        return true;
        }
    return false;
    }

bool Helper::writeMimeInfo( QMimeType mime )
    {
    KService::Ptr service = KMimeTypeTrader::self()->preferredService( mime.name());
    if( service )
        {
        outputLine( mime.name());
        outputLine( mime.comment());
        outputLine( service->name());
        return true;
        }
    return false;
    }

bool Helper::handleGetAppDescForScheme()
    {
    if( !readArguments( 1 ))
        return false;
    QString scheme = getArgument();
    if( !allArgumentsUsed())
        return false;
    QString app = getAppForProtocol( scheme );
    if( !app.isEmpty())
        {
        outputLine( app );
        return true;
        }
    return false;
    }

bool Helper::handleAppsDialog()
    {
    if( !readArguments( 1 ))
        return false;
    QString title = getArgument();
    long wid = getArgumentParent();
    if( !allArgumentsUsed())
        return false;
    KOpenWithDialog dialog( NULL );
    if( !title.isEmpty())
        dialog.setWindowTitle( title );
    dialog.hideNoCloseOnExit();
    dialog.hideRunInTerminal(); // TODO
    if( wid != 0 )
        KWindowSystem::setMainWindow( &dialog, wid );
    if( dialog.exec())
        {
        KService::Ptr service = dialog.service();
        QString command;
        if( service )
            command = service->exec();
        else if( !dialog.text().isEmpty())
            command = dialog.text();
        else
            return false;
        command = command.split( " " ).first(); // only the actual command
        command = QStandardPaths::findExecutable(command);
        if( command.isEmpty())
            return false;
        outputLine( QUrl::fromUserInput( command ).url());
        return true;
        }
    return false;
    }

bool Helper::handleGetOpenX( bool url )
    {
    if( !readArguments( 4 ))
        return false;
    QString startDir = getArgument();
    QString filter = getArgument().replace("/", "\\/"); // TODO: not used
    int selectFilter = getArgument().toInt();
    QString title = getArgument();
    bool multiple = isArgument( "MULTIPLE" );
    long wid = getArgumentParent();
    if( !allArgumentsUsed())
        return false;

    if (title.isEmpty())
        title = i18n("Open");

    if (url) {
        QList<QUrl> result;
        if (multiple)
            result = QFileDialog::getOpenFileUrls(nullptr, title, startDir);
        else
            result << QFileDialog::getOpenFileUrl(nullptr, title, startDir);
        result.removeAll(QUrl());
        if (!result.isEmpty()) {
            outputLine(QStringLiteral("0")); // filter is not implemented, so always 0 (All Files)
            for (const QUrl &url : result)
                outputLine(url.url());
            return true;
        }

    } else {
        QStringList result;
        if (multiple)
            result = QFileDialog::getOpenFileNames(nullptr, title, startDir);
        else
            result << QFileDialog::getOpenFileName(nullptr, title, startDir);
        result.removeAll(QString());
        if (!result.isEmpty()) {
            outputLine(QStringLiteral("0"));
            for (const QString &str : result)
                outputLine(str);
            return true;
        }
    }

    return false;
    }

bool Helper::handleGetSaveX( bool url )
    {
    if( !readArguments( 4 ))
        return false;
    QString startDir = getArgument();
    QString filter = getArgument().replace("/", "\\/"); // TODO: ignored
    int selectFilter = getArgument().toInt();
    QString title = getArgument();
    long wid = getArgumentParent();
    if( !allArgumentsUsed())
        return false;

    if (title.isEmpty())
        title = i18n("Save As");

    // TODO: confirm overwrite
    if (url) {
        QUrl result = QFileDialog::getSaveFileUrl(nullptr, title, startDir);
        if (result.isValid()) {
            outputLine(QStringLiteral("0"));
            outputLine(result.url());
            return true;
        }
    } else {
        QString result = QFileDialog::getSaveFileName(nullptr, title, startDir);
        if (!result.isEmpty()) {
            KRecentDocument::add(QUrl::fromLocalFile(result));
            outputLine(QStringLiteral("0"));
            outputLine(result);
            return true;
        }
    }

    return false;
    }

bool Helper::handleGetDirectoryX( bool url )
    {
    if( !readArguments( 2 ))
        return false;
    QString startDir = getArgument();
    QString title = getArgument();
    long wid = getArgumentParent();
    if( !allArgumentsUsed())
        return false;

    if (url) {
        QUrl result = QFileDialog::getExistingDirectoryUrl(nullptr, title, startDir);
        if (result.isValid()) {
            outputLine(result.url());
            return true;
        }
    } else {
        QString result = QFileDialog::getExistingDirectory(nullptr, title, startDir);
        if (!result.isEmpty()) {
            outputLine(QUrl::fromLocalFile(result).url());
            return true;
        }
    }

    return false;
    }

bool Helper::handleOpen()
    {
    if( !readArguments( 1 ))
        return false;
    QUrl url = QUrl::fromUserInput(getArgument());
    QString mime;
    if( isArgument( "MIMETYPE" ))
        mime = getArgument();
    if( !allArgumentsUsed())
        return false;
    //KApplication::updateUserTimestamp( 0 ); // TODO
    // try to handle the case when the server has broken mimetypes and e.g. claims something is application/octet-stream
    QMimeType mimeType = QMimeDatabase().mimeTypeForName(mime);
    if (!mime.isEmpty() && mimeType.isValid() && KMimeTypeTrader::self()->preferredService(mimeType.name()))
        return KRun::runUrl( url, mime, NULL ); // TODO parent
    else
        {
        (void) new KRun( url, NULL ); // TODO parent
    //    QObject::connect( run, SIGNAL( finished()), &app, SLOT( openDone()));
    //    QObject::connect( run, SIGNAL( error()), &app, SLOT( openDone()));
        return true; // TODO check for errors?
        }
    }

bool Helper::handleReveal()
    {
    if( !readArguments( 1 ))
        return false;
    QString path = getArgument();
    if( !allArgumentsUsed())
        return false;
    //KApplication::updateUserTimestamp( 0 ); // TODO
    const KService::List apps = KMimeTypeTrader::self()->query("inode/directory", "Application");
    if (apps.size() != 0)
        {
        QString command = apps.at(0)->exec().split( " " ).first(); // only the actual command
        if (command == "dolphin" || command == "konqueror")
            {
            command = QStandardPaths::findExecutable(command);
            if( command.isEmpty())
                return false;
            return KProcess::startDetached(command, QStringList() << "--select" << path);
            }
        }
    QFileInfo info(path);
    QString dir = info.dir().path();
    (void) new KRun( QUrl::fromLocalFile(dir), NULL ); // TODO parent
    return true; // TODO check for errors?
    }

bool Helper::handleRun()
    {
    if( !readArguments( 2 ))
        return false;
    QString app = getArgument();
    QString arg = getArgument();
    if( !allArgumentsUsed())
        return false;
    //KApplication::updateUserTimestamp( 0 ); // TODO
    return KRun::runCommand( KShell::quoteArg( app ) + " " + KShell::quoteArg( arg ), NULL ); // TODO parent, ASN
    }

bool Helper::handleGetDefaultFeedReader()
    {
    if( !readArguments( 0 ))
        return false;
    // firefox wants the full path
    QString reader = QStandardPaths::findExecutable("akregator"); // TODO there is no KDE setting for this
    if( !reader.isEmpty())
        {
        outputLine( reader );
        return true;
        }
    return false;
    }

bool Helper::handleOpenMail()
    {
    if( !readArguments( 0 ))
        return false;
    // this is based on ktoolinvocation_x11.cpp, there is no API for this
    KConfig config( "emaildefaults" );
    QString groupname = KConfigGroup( &config, "Defaults" ).readEntry( "Profile", "Default" );
    KConfigGroup group( &config, QString( "PROFILE_%1" ).arg( groupname ));
    QString command = group.readPathEntry( "EmailClient", QString());
    if( command.isEmpty())
        command = "kmail";
    if( group.readEntry( "TerminalClient", false ))
        {
        QString terminal = KConfigGroup( KSharedConfig::openConfig(), "General" ).readPathEntry( "TerminalApplication", "konsole" );
        command = terminal + " -e " + command;
        }
    KService::Ptr mail = KService::serviceByDesktopName( command.split( " " ).first());
    if( mail )
        {
        //KApplication::updateUserTimestamp( 0 ); // TODO
        return KRun::runService( *mail, QList<QUrl>(), NULL ); // TODO parent
        }
    return false;
    }

bool Helper::handleOpenNews()
    {
    if( !readArguments( 0 ))
        return false;
    KService::Ptr news = KService::serviceByDesktopName( "knode" ); // TODO there is no KDE setting for this
    if( news )
        {
        //KApplication::updateUserTimestamp( 0 ); // TODO
        return KRun::runService( *news, QList<QUrl>(), NULL ); // TODO parent
        }
    return false;
    }

bool Helper::handleIsDefaultBrowser()
    {
    if( !readArguments( 0 ))
        return false;
    QString browser = KConfigGroup( KSharedConfig::openConfig( "kdeglobals" ), "General" )
        .readEntry( "BrowserApplication" );
    return browser == "MozillaFirefox" || browser == "MozillaFirefox.desktop"
        || browser == "!firefox" || browser == "!/usr/bin/firefox"
        || browser == "firefox" || browser == "firefox.desktop";
    }

bool Helper::handleSetDefaultBrowser()
    {
    if( !readArguments( 1 ))
        return false;
    bool alltypes = ( getArgument() == "ALLTYPES" );
    if( !allArgumentsUsed())
        return false;
    KConfigGroup( KSharedConfig::openConfig( "kdeglobals" ), "General" )
        .writeEntry( "BrowserApplication", "firefox" );
    if( alltypes )
        {
        // TODO there is no API for this and it is a bit complex
        }
    return true;
    }

bool Helper::handleDownloadFinished()
    {
    if( !readArguments( 1 ))
        return false;
    QString download = getArgument();
    if( !allArgumentsUsed())
        return false;
    // TODO cheat a bit due to i18n freeze - the strings are in the .notifyrc file,
    // taken from KGet, but the notification itself needs the text too.
    // So create it from there.
    KConfig cfg( "kmozillahelper.notifyrc", KConfig::FullConfig, QStandardPaths::AppDataLocation );
    QString message = KConfigGroup( &cfg, "Event/downloadfinished" ).readEntry( "Comment" );
    KNotification::event( "downloadfinished", download + " : " + message );
    return true;
    }

#if 0
static bool open_error = false;

void Helper::openDone()
    {
    // like kde-open - wait 2 second to give error dialogs time to show up
    QTimer::singleShot( 2000, this, SLOT( quit()));
    if( static_cast< KRun* >( sender())->hasError())
        open_error = true;
    }
#endif

QString Helper::getAppForProtocol( const QString& protocol )
    {
    if( KProtocolInfo::isHelperProtocol( protocol ))
        {
        QString exec = KProtocolInfo::exec( protocol );
        if( !exec.isEmpty())
            {
            if( exec.contains( ' ' ))
                exec = exec.split( ' ' ).first(); // first part of command
            QString servicename;
            if( KService::Ptr service = KService::serviceByDesktopName( exec ))
                servicename = service->name();
            else
                {
                foreach( KService::Ptr service, KService::allServices())
                    {
                    QString exec2 = service->exec();
                    if( exec2.contains( ' ' ))
                        exec2 = exec2.split( ' ' ).first(); // first part of command
                    if( exec == exec2 )
                        {
                        servicename = service->name();
                        break;
                        }
                    }
                if( servicename.isEmpty() && exec == "kmailservice" ) // kmailto is handled internally by kmailservice
                    servicename = i18n( "KDE" );
                }
            return servicename;
            }
        }
    return QString();
    }

QString Helper::readLine()
    {
    QString line = input.readLine();
    line.replace( "\\n", "\n" );
    line.replace( "\\" "\\", "\\" );
    return line;
    }

void Helper::outputLine( QString line, bool escape )
    {
    if( escape )
        {
        line.replace( "\\",  "\\" "\\" );
        line.replace( "\n", "\\n" );
        }
    output << line << endl;
#ifdef DEBUG_KDE
    QTextStream( stderr ) << "OUTPUT: " << line << endl;
#endif
    }

bool Helper::readArguments( int mincount )
    {
    assert( arguments.isEmpty());
    for(;;)
        {
        QString line = readLine();
        if( input.atEnd())
            {
            arguments.clear();
            return false;
            }
        if( line == "\\E" )
            {
            arguments_read = true;
            if( arguments.count() >= mincount )
                return true;
            QTextStream( stderr ) << "Not enough arguments for KDE helper." << endl;
            return false;
            }
        arguments.append( line );
        }
    }

QString Helper::getArgument()
    {
    assert( !arguments.isEmpty());
    return arguments.takeFirst();
    }

bool Helper::isArgument( const QString& argument )
    {
    if( !arguments.isEmpty() && arguments.first() == argument )
        {
        arguments.removeFirst();
        return true;
        }
    return false;
    }

bool Helper::allArgumentsUsed()
    {
    assert( arguments_read );
    arguments_read = false;
    if( arguments.isEmpty())
        return true;
    QTextStream( stderr ) << "Unused arguments for KDE helper:" << arguments.join( " " ) << endl;
    arguments.clear();
    return false;
    }

long Helper::getArgumentParent()
    {
    if( isArgument( "PARENT" ))
        return getArgument().toLong();
    return 0;
    }

#include "main.h"
