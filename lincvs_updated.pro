TEMPLATE = app

# avoiding stripping all files
QMAKE_STRIP = echo
target.extra = strip $(TARGET)
#; cp -f $(TARGET) ${PREFIX}/bin/$(TARGET) 

QMAKE_CXXFLAGS += -fpermissive
QMAKE_QMAKE = qmake-qt3
#QMAKE_UIC      = /usr/lib/qt3/bin/uic
INCLUDEPATH += /usr/share/qt3/mkspecs/linux-g++
INCLUDEPATH += /usr/include/qt3
#QMAKE_INCPATH += /usr/include/qt
#INCLUDEPATH += /usr/include/qt
#INCLUDEPATH += /usr/include/qt4
#INCLUDEPATH += /usr/share/qt3/mkspecs/linux-g++
QMAKE_LIBDIR = /usr/lib/

#configuration for Unix AND Mac!
#see below for multithreading on Unix ...
unix:CONFIG      += qt warn_on release exceptions

#resources for Mac
mac:plists.path = CrossVC.app/Contents
mac:plists.files = mac/Info.plist
mac:RC_FILE = mac/application.icns
mac:INSTALLS += plists


#configuration for Unix AND Mac!
unix {
	exists( $(QMAKE_LIBDIR)/libqt-mt* ) {
		message( "Configuring for multi-threaded Qt..." )
		CONFIG += thread
	}
}

# check timezone functions (Unix only)
!mac:unix {
   message( "Check for timezone function..." )
   system(cd test && qmake -o Makefile check_tz.pro && make)
   exists(test/check_tz) {
      # use gmtoff member of tm structure
      message("Use gmtoff member of tm structure")
      DEFINES += USE_TM_GMTOFF
   }
   !exists(test/check_tz) {
      # could not build test file --> use old timezone function
      message("Use old timezone function")
   }
   system(cd test && make clean)
   system(cd test && rm Makefile && rm check_tz)
}
mac {
   DEFINES += USE_TM_GMTOFF
}

# check for standard compliant compiler (Unix only)
!mac:unix {
   message( "Check for standard compliant compiler..." )
   system(cd test && qmake -o Makefile check_std.pro && make)
   exists(test/check_std) {
      # compiler knows std
      message("Use std namespace")
   }
   !exists(test/check_std) {
      # could not build test file --> compiler does not know std
      message("Hide std namespace")
      DEFINES += DONT_USE_STD
   }
   system(cd test && make clean)
   system(cd test && rm Makefile && rm check_std)
}

# check for working exception handling (Unix only)
!mac:unix {
   message( "Check for working exception handling..." )
   system(cd test && qmake -o Makefile check_exc.pro && make)
   exists(test/check_exc) {
      # exception handling works
      message("Exception handling works")
   }
   !exists(test/check_exc) {
      # could not build test file --> compiler needs an extra flag
      message("Added -fexceptions to CXXFLAGS for working exception handling")
      QMAKE_CXXFLAGS += -fexceptions
   }
   system(cd test && make clean)
   system(cd test && rm Makefile && rm check_exc)
}

# check for nanosleep (Unix only)
!mac:unix {
   message( "Check for nanosleep..." )
   system(cd test && qmake -o Makefile check_nano.pro && make)
   exists(test/check_nano) {
      # use nanosleep
      message("Use nanosleep")
      DEFINES += NANOSLEEP
   }
   !exists(test/check_nano) {
      # could not build test file --> use usleep
      message("Use usleep")
   }
   system(cd test && make clean)
   system(cd test && rm Makefile && rm check_nano)
}

#additional configure options

# Some Qt versions have buggy clipboard support. If you notice long delays
# after mouse actions (left/right click or drag/drop) you might want to
# disable clipboard support here

#unix:CONFIG += no-clipboard

#FAM
#!mac:unix:CONFIG += fam

#DNOTIFY (only Linux)
#!mac:unix:CONFIG += dnotify

#ASKPASS
!mac:unix:CONFIG += ssh-askpass
mac:CONFIG += ssh-askpass.app

#RSHWRAPPER (only Linux)
unix:CONFIG += rsh-wrapper

#SOLARIS (we must link against -lrt)
#!mac:unix:CONFIG += lrt

#IRIX
unix {
  UNAME = $$system(uname -s)
  contains( UNAME, [iI][rR][iI][xX]64 ){
    message( This looks like Irix64 ($$UNAME) to me )

    QMAKE_CXXFLAGS += -LANG:std
    QMAKE_LFLAGS += -LANG:std
  }
}


SOURCES	+= config/config.cpp \
	compat/linux-compat.cpp \
	compat/mac-compat.cpp \
        cvslib/CCvsOutput.cpp \
	cvslib/FileListView.cpp \
	cvslib/FileListViewItem.cpp \
	cvslib/LinCVSLog.cpp \
	cvslib/SyntaxHighlighter.cpp \
	cvslib/cvsconfig.cpp \
	cvslib/cvsconfig_old.cpp \
	cvslib/funcs.cpp \
	cvslib/TextCodec.cpp \
	cvslib/TextDecoder.cpp \
	cvslib/TextEncoder.cpp \
	cvslib/wrapper.cpp \
	cvslib/Menu.cpp \
	cvslib/ColorButton.cpp \
	cvslib/qtdatetime.cpp \
	src/aboutdialogimpl.cpp \
	src/AnnotateDialogImpl.cpp \
	src/AnnotateGrepLineDialogImpl.cpp \
	src/AnnotateGrepLinesDialogImpl.cpp \
	src/CommandInterface.cpp \
	src/CommitDialogImpl.cpp \
	src/CustomizeDialogImpl.cpp \
	src/CvsFileViewer.cpp \
	src/DiffDialogImpl.cpp \
	src/DiffADialogImpl.cpp \
	src/EditorsDialogImpl.cpp \
	src/HistoryDialogImpl.cpp \
	src/InteractiveCmdThread.cpp \
	src/LogDialogImpl.cpp \
	src/MenuItem.cpp \
	src/MergeDialogImpl.cpp \
	src/pixmapcache.cpp \
	src/PixmapTimer.cpp \
	src/EditProfilesDialogImpl.cpp \
	src/ProfilesDialogImpl.cpp \
	src/PropertiesDialogImpl.cpp \
	src/settingsdialogimpl.cpp \
	src/TagDialogImpl.cpp \
	src/TagStdDialogImpl.cpp \
	src/WatchersDialogImpl.cpp \
	src/colortab.cpp \
	src/controls.cpp \
	src/cvsignorelistview.cpp \
	src/cvslistview.cpp \
	src/cvstoolbar.cpp \
	src/diffview.cpp \
	src/CEntries.cpp \
	src/CCvsEntries.cpp \
	src/directory.cpp \
	src/CvsDirectory.cpp \
	src/getCvsMod.cpp \
	src/globals.cpp \
	src/login.cpp \
	src/loglist.cpp \
	src/logtree.cpp \
	src/main.cpp \
	src/noncvslistview.cpp \
	src/qttableview.cpp \
	src/ModuleBrowserImpl.cpp \
	src/WrappersIgnoreDialogImpl.cpp \
	src/ImportDialogImpl.cpp \
	src/CheckoutDialogImpl.cpp \
        src/cvscontrol.cpp \
	src/lincvs.cpp \
	src/flatsplitter_impl.cpp \
	src/ProjectSettings.cpp \
	src/FileTableImpl.cpp \
	src/ResolvDialogImpl.cpp \
	src/CvsBuffer.cpp \
	src/ccvscommand.cpp \
        src/DirConnector.cpp \
        src/GrabKeyboardImpl.cpp \
        src/CustomizeShortcutsDialogImpl.cpp \
        src/FileMapperDialogImpl.cpp \
        src/UpdateOtherRevisionDialogImpl.cpp \
        src/Validators.cpp \
        src/RevisionWidgetImpl.cpp \
        src/UpdateOtherRevisionStdDialogImpl.cpp \
        src/StatusWidget.cpp \
        src/GuiEventBlocker.cpp \
        src/ExtTimer.cpp \
	src/Patch.cpp \
	src/PatchDialogImpl.cpp \
	src/Edit.cpp \
	src/Watch.cpp \
        src/Merge.cpp \
        src/Diff.cpp \
	src/Annotate.cpp \
	src/History.cpp \
	src/Log.cpp \
        src/Update.cpp \
	src/Checkout.cpp \
        src/Status.cpp \
        src/Import.cpp \
        src/Tag.cpp \
        src/Commit.cpp \
        src/AutoCheck.cpp \
        src/Release.cpp \
        src/Add.cpp \
        src/Remove.cpp \
        src/Rename.cpp \
        src/Move.cpp \
        src/SshKeyDialogImpl.cpp

HEADERS	+= config/config.h \
	compat/linux-compat.h \
	compat/mac-compat.h \
        cvslib/CCvsOutput.h \
	cvslib/FileListView.h \
	cvslib/FileListViewItem.h \
	cvslib/LinCVSLog.h \
	cvslib/SyntaxHighlighter.h \
	cvslib/cvsconfig.h \
	cvslib/cvsconfig_old.h \
	cvslib/funcs.h \
	cvslib/wrapper.h \
	cvslib/TextCodec.h \
	cvslib/TextDecoder.h \
	cvslib/TextEncoder.h \
	cvslib/Menu.h \
        cvslib/filesubr.h \
        cvslib/tzconvert.h \
        cvslib/DirBase.h \
        cvslib/GuardedDir.h \
	cvslib/ColorButton.h \
        cvslib/qtdatetime.h \
	src/aboutdialogimpl.h \
	src/AnnotateDialogImpl.h \
	src/AnnotateGrepLineDialogImpl.h \
	src/AnnotateGrepLinesDialogImpl.h \
	src/CommandInterface.h \
	src/CommitDialogImpl.h \
	src/CustomizeDialogImpl.h \
	src/CvsFileViewer.h \
	src/DiffDialogImpl.h \
	src/DiffADialogImpl.h \
	src/EditorsDialogImpl.h \
	src/HistoryDialogImpl.h \
	src/InteractiveCmdThread.h \
	src/LogDialogImpl.h \
	src/MenuItem.h \
	src/MergeDialogImpl.h \
	src/pixmapcache.h \
	src/PixmapTimer.h \
	src/EditProfilesDialogImpl.h \
	src/ProfilesDialogImpl.h \
	src/PropertiesDialogImpl.h \
	src/settingsdialogimpl.h \
	src/TagDialogImpl.h \
	src/TagStdDialogImpl.h \
	src/WatchersDialogImpl.h \
	src/colortab.h \
	src/controls.h \
	src/cvsignorelistview.h \
	src/cvslistview.h \
	src/cvstoolbar.h \
	src/diffview.h \
	src/CEntries.h \
	src/CCvsEntries.h \
	src/directory.h \
	src/CvsDirectory.h \
	src/getCvsMod.h \
	src/globals.h \
	src/login.h \
	src/loglist.h \
	src/logtree.h \
	src/noncvslistview.h \
	src/profile.h \
	src/time_ac.h \
	src/qttableview.h \
	src/ModuleBrowserImpl.h \
	src/WrappersIgnoreDialogImpl.h \
	src/ImportDialogImpl.h \
        src/CheckoutDialogImpl.h \
        src/cvscontrol.h \
	src/lincvs.h \
	src/flatsplitter_impl.h \
	src/ProjectSettings.h \
	src/FileTableImpl.h \
	src/ResolvDialogImpl.h \
	src/CvsBuffer.h \
        src/ccvscommand.h \
        src/DirConnector.h \
        src/GrabKeyboardImpl.h \
        src/CustomizeShortcutsDialogImpl.h \
        src/FileMapperDialogImpl.h \
        src/UpdateOtherRevisionDialogImpl.h \
        src/Validators.h \
        src/RevisionWidgetImpl.h \
        src/UpdateOtherRevisionStdDialogImpl.h \
        src/ImportPreview.ui.h \
        src/StatusWidget.h \
        src/GuiEventBlocker.h \
        src/ExtTimer.h \
	src/Patch.h \
	src/PatchDialogImpl.h \
	src/Edit.h \
	src/Watch.h \
        src/Merge.h \
        src/Diff.h \
	src/Annotate.h \
	src/History.h \
	src/Log.h \
        src/Update.h \
	src/Checkout.h \
        src/Status.h \
        src/Import.h \
        src/Tag.h \
        src/Commit.h \
        src/AutoCheck.h \
        src/Release.h \
        src/Add.h \
        src/Remove.h \
        src/Rename.h \
        src/Move.h \
        src/SshKeyDialogImpl.h

UI_DIR = .ui
MOC_DIR = .moc
OBJECTS_DIR = .obj
!mac:unix:TARGET = crossvc.bin
mac:TARGET       = CrossVC

#does not work yet!
#DISTFILES = $(IMAGES) \
#            $(INTERFACES) \
#            $(HEADERS) \
#            $(SOURCES)
	    


DEPENDPATH = src \
             compat \
             config \
             cvslib \
             .ui

TRANSLATIONS = ts/ca_ES.ts \
	       ts/de.ts \
	       ts/es.ts \
               ts/fr.ts \
               ts/it.ts \
               ts/ja.ts \
               ts/pt_BR.ts \
               ts/ru.ts \
               ts/vi.ts \
               ts/cz.ts

CODEC = ISO-8859-1
	

#INSTALLS
help.path = CrossVC/Help
help.files = AUTHORS \
             ChangeLog \
             COPYING \
             doc/FAM-HOWTO.txt \
             doc/FAQ.txt \
             doc/INFO.txt \
             doc/INSTALL \
             doc/INSTALL.html \
             LICENSE \
             NEWS \
             doc/PROXY-HOWTO.txt \
             doc/README \
             doc/README.html \
             doc/SSH-HOWTO.txt \
             THANKS \
             VERSION

INSTALLS += help

help_de.path = CrossVC/Help/Translations/de
help_de.files = doc/translations/de/*.txt doc/translations/de/*.html

INSTALLS += help_de

help_it.path = CrossVC/Help/Translations/it
help_it.files = doc/translations/it/*.txt doc/translations/it/*.html

INSTALLS += help_it

help_ru.path = CrossVC/Help/Translations/ru
help_ru.files = doc/translations/ru/*.txt doc/translations/ru/*.html

INSTALLS += help_ru


messages.path = CrossVC/Messages
messages.files = ts/*.qm

INSTALLS += messages

tools.path = CrossVC/Tools
unix:tools.files = tools/*.sh

INSTALLS += tools

target.path = CrossVC
INSTALLS += target


# we want every build to include the compiletime:

BuildTime.target = config/config.cpp
BuildTime.commands = touch $$BuildTime.target
BuildTime.depends = BuildTarget

QMAKE_EXTRA_UNIX_TARGETS += BuildTime BuildTarget

FORMS	= \
	src/aboutdialog.ui \
	src/AnnotateDialog.ui \
	src/AnnotateGrepLineDialog.ui \
	src/AnnotateGrepLinesDialog.ui \
	src/CommitDialog.ui \
	src/CustomizeDialog.ui \
	src/DiffDialog.ui \
	src/DiffADialog.ui \
	src/EditorsDialog.ui \
	src/HistoryDialog.ui \
	src/LogDialog.ui \
	src/MergeDialog.ui \
	src/EditProfilesDialog.ui \
	src/ProfilesDialog.ui \
	src/PropertiesDialog.ui \
	src/settingsdialog.ui \
	src/TagDialog.ui \
	src/TagStdDialog.ui \
	src/WatchersDialog.ui \
	src/ModuleBrowser.ui \
	src/WrappersIgnoreDialog.ui \
	src/ImportDialog.ui \
	src/CheckoutDialog.ui \
	src/ImportPreview.ui \
	src/ProgressDialog.ui \
	src/cmainwindow.ui \
	src/ResolvDialog.ui \
        src/GrabKeyboard.ui \
        src/CustomizeShortcutsDialog.ui \
        src/MappingDialog.ui \
        src/UpdateOtherRevisionDialog.ui \
        src/UpdateOtherRevisionStdDialog.ui \
        src/RevisionWidget.ui \
        src/VerifyDialog.ui \
	src/PatchDialog.ui \
        src/SshKeyDialog.ui

IMAGES	= images/Connect32x16-00.xpm \
	images/Connect32x16-01.xpm \
	images/Connect32x16-02.xpm \
	images/Connect32x16-03.xpm \
	images/Delete16x16.xpm \
	images/Disable16x16.xpm \
	images/Enable16x16.xpm \
	images/FileASCII16x16.xpm \
	images/FileAdded16x16.xpm \
	images/FileBinary16x16.xpm \
	images/FileConflict16x16.xpm \
	images/FileLocked16x16.xpm \
	images/FileModified16x16.xpm \
	images/FileNeedsCheckout16x16.xpm \
	images/FileNeedsMerge16x16.xpm \
	images/FileNeedsPatch16x16.xpm \
	images/FileRemoved16x16.xpm \
	images/FileStatus16x16.xpm \
	images/FileUnchanged16x16.xpm \
	images/FileUnknown16x16.xpm \
	images/FileWriteable16x16.xpm \
	images/FolderClosed16x16.xpm \
	images/FolderClosedAuto26x16.xpm \
	images/FolderClosedLocked16x16.xpm \
	images/FolderClosedLockedNonCVS16x16.xpm \
	images/FolderClosedLockedModified16x16.xpm \
	images/FolderClosedLockedProblem16x16.xpm \
	images/FolderClosedLockedUncommitted16x16.xpm \
	images/FolderClosedLockedWarn16x16.xpm \
	images/FolderClosedNonCVS16x16.xpm \
	images/FolderClosedNonCVSAuto26x16.xpm \
	images/FolderClosedModified16x16.xpm \
	images/FolderClosedModifiedAuto26x16.xpm \
	images/FolderClosedProblem16x16.xpm \
	images/FolderClosedProblemAuto26x16.xpm \
	images/FolderClosedUncommitted16x16.xpm \
	images/FolderClosedUncommittedAuto26x16.xpm \
	images/FolderClosedWarn16x16.xpm \
	images/FolderClosedWarnAuto26x16.xpm \
	images/FolderDisabled16x16.xpm \
        images/FolderMissing16x16.xpm \
	images/FolderOpened16x16.xpm \
	images/FolderOpenedProblem16x16.xpm \
	images/FolderStatus16x16.xpm \
	images/FolderStatusAuto26x16.xpm \
	images/LogTree16x16.xpm \
	images/LogTree32x32.xpm \
	images/QueryUpdate16x16.xpm \
	images/Tag16x16.xpm \
	images/Tag32x32.xpm \
	images/Tag30x16.xpm \
	images/TagTag30x16.xpm \
	images/BranchTag30x16.xpm \
	images/bgu.xpm \
	images/commit_16x16.xpm \
	images/commit_disabled_16x16.xpm \
	images/crea.xpm \
	images/cvs_annotate_16x16.xpm \
	images/cvs_annotate_disabled_16x16.xpm \
	images/cvs_watch_add_16x16.xpm \
	images/cvs_watch_off_16x16.xpm \
	images/cvs_watch_on_16x16.xpm \
	images/cvs_watch_remove_16x16.xpm \
	images/cvs_watch_add_disabled_16x16.xpm \
	images/cvs_watch_off_disabled_16x16.xpm \
	images/cvs_watch_on_disabled_16x16.xpm \
	images/cvs_watch_remove_disabled_16x16.xpm \
	images/lincvs-16.xpm \
	images/lincvs-32.xpm \
	images/lincvs-48.xpm \
	images/lincvs_disabled_16x16.xpm \
	images/lincvs-missing.xpm \
	images/module_add_16x16.xpm \
	images/module_add_disabled_16x16.xpm \
	images/quit_16x16.xpm \
	images/quit_disabled_16x16.xpm \
	images/stop_16x16.xpm \
	images/stop_disabled_16x16.xpm \
	images/sunsite.xpm \
	images/update_16x16.xpm \
	images/update_disabled_16x16.xpm \
	images/visoel.xpm \
	images/who_changed_line_16x16.xpm \
	images/who_changed_lines_16x16.xpm \
	images/who_changed_line_disabled_16x16.xpm \
	images/who_changed_lines_disabled_16x16.xpm \
	images/arrow_down_16x16.xpm \
	images/arrow_left_16x16.xpm \
	images/arrow_right_16x16.xpm \
	images/arrow_up_16x16.xpm \
	images/checkout_16x16.xpm \
	images/checkout_disabled_16x16.xpm \
	images/merge_16x16.xpm \
	images/merge_disabled_16x16.xpm \
	images/CmdImport32x32.xpm \
	images/CmdImport_disabled_32x32.xpm \
	images/CmdExport32x32.xpm \
	images/CmdTimer32x32.xpm \
	images/CmdTimerDisabled32x32.xpm \
	images/module_status_16x16.xpm \
	images/module_status_disabled_16x16.xpm \
	images/refresh_16x16.xpm \
	images/module_autoupdate_16x16.xpm \
	images/module_autoupdate_disabled_16x16.xpm \
        images/anchor_12x16.xpm \
	images/messagebox_warning.png \
        images/OpenShell16x16.xpm
	
INCLUDEPATH	+= ./ ./src ./config ./cvslib ./compat
LANGUAGE	= C++

#USE FAM: !run make clean before recompiling!
fam {
  DEFINES += USE_FAM
  SOURCES += src/FamConnector.cpp
  HEADERS += src/FamConnector.h
  LIBS += /usr/lib/libfam.so
  LIBS += /home/frank/work/projects/fam-2.6.10/libfam/.libs/libfam.a
}

#USE DNOTIFY: !run make clean before recompiling!
dnotify {
  DEFINES += USE_DNOTIFY
  SOURCES += src/DNotifyConnector.cpp
  HEADERS += src/DNotifyConnector.h
}

# on unix, compile ssh-askpass tool in contrib/ssh-askpass/
# and install into CrossVC/Tools
ssh-askpass {
   system(cd contrib/ssh-askpass && ./makeProject.sh)
   exists(contrib/ssh-askpass/ssh-askpass.bin) {
      askpass.path = CrossVC/Tools
      askpass.files = contrib/ssh-askpass/*.bin
      INSTALLS += askpass
      message("ssh-askpass built succeeded")
   }
   !exists(contrib/ssh-askpass/ssh-askpass.bin):message("ssh-askpass built failed")
}

# on mac, compile ssh-askpass.app tool in contrib/ssh-askpass/
# and install into CrossVC/Tools
ssh-askpass.app {
   system(cd contrib/ssh-askpass && ./makeProject.sh)
   exists(contrib/ssh-askpass/ssh-askpass.app) {
      askpass.path = CrossVC/Tools
      askpass.files = contrib/ssh-askpass/*.app
      INSTALLS += askpass
      message("ssh-askpass built succeeded")
   }
   !exists(contrib/ssh-askpass/ssh-askpass.app):message("ssh-askpass built failed")
}

# on unix, compile rshwrapper tool in contrib/rshwrapper/
# and install into CrossVC/Tools
rsh-wrapper {
   message("Building rshwrapper ...")
   system(cd contrib/rshwrapper && make)
   exists(contrib/rshwrapper/rshwrapper) {
      wrapper.path = CrossVC/Tools
      wrapper.files = contrib/rshwrapper/rshwrappe?
      INSTALLS += wrapper
      message("rshwrapper built succeeded")
   }
   !exists(contrib/rshwrapper/rshwrapper):message("rshwrapper built failed")
}

# on SOLARIS we must link against -lrt
lrt:LIBS += -lrt

# disable clipboard support
no-clipboard {
   DEFINES += NO_CLIPBOARD
}
