# Maintainer: Piotr Rogoza <rogoza dot piotr at gmail dot com>

_perlmod=Padre
_author='P/PL/PLAVEN'
pkgname=perl-padre-git
pkgver=3f55f028
pkgrel=1
pkgdesc="Perl made IDE, highly customisable"
#url='http://padre.perlide.org/'
url='http://search.cpan.org/dist/Padre/'
arch=(any)
license=('GPL' 'PerlArtistic')
conflicts=(perl-padre)
makedepends=(
'perl-module-install>=1.12'
  'perl-module-starter>=1.60'
  'perl-locale-msgfmt>=0.15'
  'perl-wx>0.9916'
#  'perl-extutils-makemaker>=6.52' → perl
#  'perl-extutils-embed>=1.250601' → perl
# configure_requires
#   perl-extutils-makemaker → perl
#   perl-extutils-embed → perl
  'perl-alien-wxwidgets>=0.46'
)
checkdepends=(
#  perl-test-more → perl
# Ticket #1419: Padre and the soon to be Perl 5.16
'perl-test-warn>=0.24'
'perl-test-mockobject>=1.09'
'perl-test-script>=1.07'
'perl-test-exception>=0.27'
'perl-test-nowarnings>=1.04'
perl-io-socket-ip
perl-parse-functions
)
depends=(
  'perl>=5.11'
  'perl-algorithm-diff>=1.19'
#  perl-app-cpanminus → cpanminus
  'cpanminus>=0.9923'
#  perl-b-deparse → perl
  'perl-capture-tiny>=0.06'
#  perl-cgi → perl
  'perl-class-adapter>=1.05'
  'perl-class-inspector>=1.22'
  'perl-class-xsaccessor>=1.13'
#  perl-cwd → perl
#  perl-data-dumper → perl
  'perl-dbd-sqlite>=1.35'
  'perl-dbi>=1.58'
  'perl-debug-client>=0.29'
  'perl-devel-dumpvar>=0.04'
  'perl-devel-refactor>=0.05'
#  perl-encode → perl
#  perl-extutils-makemaker → perl
#  perl-extutils-manifest → perl
#  perl-file-basename → perl
#  perl-file-glob → perl
perl-extutils-makemaker # → 'perl-file-copy-recursive>=0.37'
  'perl-file-find-rule>=0.30'
  'perl-file-homedir>=0.91'
#  perl-file-path → perl
  'perl-file-remove>=1.40'
  'perl-file-sharedir>=1.00'
#  perl-file-spec → perl
#  perl-file-spec-functions → perl
#  perl-file-temp → perl
  'perl-file-which>=1.08'
  'perl-file-pushd>=1.00'
#  perl-findbin → perl
#  perl-getopt-long → perl
#  perl-html-entities → perl-html-parser
  'perl-html-parser>=3.58'
#  perl-io-socket → perl
  'perl-io-string>=1.08'
  'perl-ipc-run>=0.83'
#  perl-ipc-open2 → perl
#  perl-ipc-open3 → perl
  'perl-json-xs>=2.29'
#  perl-list-util → perl
  'perl-list-moreutils>=0.22'
#  perl-lwp → perl-libwww
#  perl-lwp-useragent → perl-libwww
  'perl-libwww>=5.815'
# perl-module-build → perl
# perl-module-corelist → perl
  'perl-module-manifest>=0.07'
  perl-module-starter
  'perl-orlite>=1.98'
  'perl-orlite-migrate>=1.10'
  'perl-params-util>=0.33'
  'perl-parse-errorstring-perl>=0.18'
  'perl-parse-exuberantctags>=1.00'
#  perl-pod-functions → perl
  'perl-pod-pom>=0.17'
#  perl-pod-simple → perl
#  perl-pod-simple-xhtml → perl
  'perl-pod-abstract>=0.16'
  'perl-pod-perldoc>=3.15'
  'perl-pod2-base>=0.043'
#  perl-posix → perl
  'perl-ppi>=1.215'
  'perl-ppix-editortools>=0.18'
  'perl-ppix-regexp>=0.011'
  'perl-probe-perl>=0.01'
#  perl-storable → perl
  'perl-sort-versions>=1.5'
  'perl-template-tiny>=0.11'
#  perl-term-readline → perl
#  perl-text-balanced → perl
  'perl-text-diff>=1.41'
  'perl-text-findindent>=0.10'
#  perl-time-hires → perl
  'perl-text-patch>=1.8'
#  perl-threads → perl
#  perl-threads-shared → perl
  'perl-uri>=0.80'
#   perl-version → perl`
  'perl-wx>0.9916'
  'perl-wx-perl-processstream>=0.32'
  'perl-wx-scintilla>=0.39'
  'perl-yaml-tiny>=1.32'
# Special dependencies
# In the Padre.ppd file we need to list IO-stringy instead
#  perl-io-scalar → perl-io-stringy
  'perl-io-stringy>=2.110'

#  hicolor-icon-theme → but already satisfied
)
provides=(
padre
perl-padre
perl-padre-autosave
perl-padre-breakpoints
perl-padre-browser
perl-padre-browser-document
perl-padre-browser-pod
perl-padre-browser-pseudoperldoc
perl-padre-cpan
perl-padre-cache
perl-padre-command
perl-padre-comment
perl-padre-config
perl-padre-config-apply
perl-padre-config-host
perl-padre-config-human
perl-padre-config-patch
perl-padre-config-project
perl-padre-config-setting
perl-padre-constant
perl-padre-current
perl-padre-db
perl-padre-db-bookmark
perl-padre-db-history
perl-padre-db-hostconfig
perl-padre-db-lastpositioninfile
perl-padre-db-recentlyused
perl-padre-db-session
perl-padre-db-sessionfile
perl-padre-db-timeline
perl-padre-delta
perl-padre-desktop
perl-padre-document
perl-padre-document-csharp
perl-padre-document-csharp-functionlist
perl-padre-document-java
perl-padre-document-java-functionlist
perl-padre-document-patch
perl-padre-document-perl
perl-padre-document-perl-autocomplete
perl-padre-document-perl-beginner
perl-padre-document-perl-functionlist
perl-padre-document-perl-help
perl-padre-document-perl-lexer
perl-padre-document-perl-outline
perl-padre-document-perl-ppilexer
perl-padre-document-perl-quickfix
perl-padre-document-perl-quickfix-includemodule
perl-padre-document-perl-quickfix-strictwarnings
perl-padre-document-perl-starter
perl-padre-document-perl-starter-style
perl-padre-document-perl-syntax
perl-padre-document-python
perl-padre-document-python-functionlist
perl-padre-document-ruby
perl-padre-document-ruby-functionlist
perl-padre-feature
perl-padre-file
perl-padre-file-ftp
perl-padre-file-http
perl-padre-file-local
perl-padre-help
perl-padre-locale
perl-padre-locale-format
perl-padre-locale-t
perl-padre-lock
perl-padre-locker
perl-padre-logger
perl-padre-mime
perl-padre-ppi
perl-padre-ppi-endifypod
perl-padre-ppi-transform
perl-padre-ppi-updatecopyright
perl-padre-perl
perl-padre-plugin
perl-padre-plugin-devel
perl-padre-plugin-my
perl-padre-plugin-popularitycontest
perl-padre-plugin-popularitycontest-ping
perl-padre-pluginbuilder
perl-padre-pluginhandle
perl-padre-pluginmanager
perl-padre-pod2html
perl-padre-portable
perl-padre-project
perl-padre-project-null
perl-padre-project-perl
perl-padre-project-perl-dz
perl-padre-project-perl-eumm
perl-padre-project-perl-mb
perl-padre-project-perl-mi
perl-padre-project-perl-temp
perl-padre-project-temp
perl-padre-projectmanager
perl-padre-quickfix
perl-padre-role-pubsub
perl-padre-role-task
perl-padre-sloc
perl-padre-svn
perl-padre-search
perl-padre-servermanager
perl-padre-startup
perl-padre-sync
perl-padre-task
perl-padre-task-addition
perl-padre-task-backupunsaved
perl-padre-task-browser
perl-padre-task-cpan
perl-padre-task-diff
perl-padre-task-eval
perl-padre-task-file
perl-padre-task-findinfiles
perl-padre-task-findunmatchedbrace
perl-padre-task-findvariabledeclaration
perl-padre-task-functionlist
perl-padre-task-introducetemporaryvariable
perl-padre-task-lwp
perl-padre-task-launchdefaultbrowser
perl-padre-task-lexicalreplacevariable
perl-padre-task-openresource
perl-padre-task-outline
perl-padre-task-ppi
perl-padre-task-pod2html
perl-padre-task-recentfiles
perl-padre-task-replaceinfiles
perl-padre-task-run
perl-padre-task-sloc
perl-padre-task-syntax
perl-padre-task-transform
perl-padre-task-vcs
perl-padre-taskhandle
perl-padre-taskmanager
perl-padre-taskqueue
perl-padre-taskworker
perl-padre-template
perl-padre-test
perl-padre-transform
perl-padre-unload
perl-padre-util
perl-padre-util-commandline
perl-padre-util-filebrowser
perl-padre-util-svn
perl-padre-util-win32
perl-padre-wx
perl-padre-wx-action
perl-padre-wx-actionlibrary
perl-padre-wx-actionqueue
perl-padre-wx-app
perl-padre-wx-auimanager
perl-padre-wx-bottom
perl-padre-wx-browser
perl-padre-wx-cpan
perl-padre-wx-cpan-listview
perl-padre-wx-choice-files
perl-padre-wx-choice-theme
perl-padre-wx-combobox-findterm
perl-padre-wx-combobox-history
perl-padre-wx-command
perl-padre-wx-constant
perl-padre-wx-dialog-about
perl-padre-wx-dialog-advanced
perl-padre-wx-dialog-bookmarks
perl-padre-wx-dialog-debugoptions
perl-padre-wx-dialog-diff
perl-padre-wx-dialog-document
perl-padre-wx-dialog-expression
perl-padre-wx-dialog-filtertool
perl-padre-wx-dialog-find
perl-padre-wx-dialog-findinfiles
perl-padre-wx-dialog-form
perl-padre-wx-dialog-goto
perl-padre-wx-dialog-helpsearch
perl-padre-wx-dialog-modulestarter
perl-padre-wx-dialog-openresource
perl-padre-wx-dialog-openurl
perl-padre-wx-dialog-patch
perl-padre-wx-dialog-perlfilter
perl-padre-wx-dialog-pluginmanager
perl-padre-wx-dialog-positions
perl-padre-wx-dialog-preferences
perl-padre-wx-dialog-quickmenuaccess
perl-padre-wx-dialog-refactorselectfunction
perl-padre-wx-dialog-regexeditor
perl-padre-wx-dialog-replace
perl-padre-wx-dialog-replaceinfiles
perl-padre-wx-dialog-sloc
perl-padre-wx-dialog-sessionmanager
perl-padre-wx-dialog-sessionmanager2
perl-padre-wx-dialog-sessionsave
perl-padre-wx-dialog-shortcut
perl-padre-wx-dialog-snippet
perl-padre-wx-dialog-special
perl-padre-wx-dialog-sync
perl-padre-wx-dialog-text
perl-padre-wx-dialog-warning
perl-padre-wx-dialog-wherefrom
perl-padre-wx-dialog-windowlist
perl-padre-wx-diff
perl-padre-wx-diff2
perl-padre-wx-directory
perl-padre-wx-directory-browse
perl-padre-wx-directory-path
perl-padre-wx-directory-search
perl-padre-wx-directory-treectrl
perl-padre-wx-display
perl-padre-wx-editor
perl-padre-wx-editor-lock
perl-padre-wx-editor-menu
perl-padre-wx-fbp-about
perl-padre-wx-fbp-bookmarks
perl-padre-wx-fbp-breakpoints
perl-padre-wx-fbp-cpan
perl-padre-wx-fbp-debugoptions
perl-padre-wx-fbp-debugoutput
perl-padre-wx-fbp-debugger
perl-padre-wx-fbp-diff
perl-padre-wx-fbp-document
perl-padre-wx-fbp-expression
perl-padre-wx-fbp-find
perl-padre-wx-fbp-findfast
perl-padre-wx-fbp-findinfiles
perl-padre-wx-fbp-foundinfiles
perl-padre-wx-fbp-modulestarter
perl-padre-wx-fbp-outline
perl-padre-wx-fbp-pod
perl-padre-wx-fbp-patch
perl-padre-wx-fbp-pluginmanager
perl-padre-wx-fbp-preferences
perl-padre-wx-fbp-replace
perl-padre-wx-fbp-replaceinfiles
perl-padre-wx-fbp-sloc
perl-padre-wx-fbp-sessionmanager
perl-padre-wx-fbp-snippet
perl-padre-wx-fbp-special
perl-padre-wx-fbp-sync
perl-padre-wx-fbp-syntax
perl-padre-wx-fbp-tasklist
perl-padre-wx-fbp-text
perl-padre-wx-fbp-vcs
perl-padre-wx-fbp-wherefrom
perl-padre-wx-filedroptarget
perl-padre-wx-frame-html
perl-padre-wx-frame-null
perl-padre-wx-frame-pod
perl-padre-wx-functionlist
perl-padre-wx-htmlwindow
perl-padre-wx-icon
perl-padre-wx-left
perl-padre-wx-listview
perl-padre-wx-main
perl-padre-wx-menu
perl-padre-wx-menu-debug
perl-padre-wx-menu-edit
perl-padre-wx-menu-file
perl-padre-wx-menu-help
perl-padre-wx-menu-perl
perl-padre-wx-menu-refactor
perl-padre-wx-menu-run
perl-padre-wx-menu-search
perl-padre-wx-menu-tools
perl-padre-wx-menu-view
perl-padre-wx-menu-window
perl-padre-wx-menubar
perl-padre-wx-notebook
perl-padre-wx-nth
perl-padre-wx-outline
perl-padre-wx-output
perl-padre-wx-panel-breakpoints
perl-padre-wx-panel-debugoutput
perl-padre-wx-panel-debugger
perl-padre-wx-panel-findfast
perl-padre-wx-panel-foundinfiles
perl-padre-wx-panel-tasklist
perl-padre-wx-popup
perl-padre-wx-printout
perl-padre-wx-progress
perl-padre-wx-replaceinfiles
perl-padre-wx-right
perl-padre-wx-role-conduit
perl-padre-wx-role-config
perl-padre-wx-role-context
perl-padre-wx-role-dialog
perl-padre-wx-role-idle
perl-padre-wx-role-main
perl-padre-wx-role-timer
perl-padre-wx-role-view
perl-padre-wx-scintilla
perl-padre-wx-scrolllock
perl-padre-wx-selectionlock
perl-padre-wx-statusbar
perl-padre-wx-style
perl-padre-wx-syntax
perl-padre-wx-tasklist
perl-padre-wx-textentrydialog-history
perl-padre-wx-theme
perl-padre-wx-toolbar
perl-padre-wx-treectrl
perl-padre-wx-util
perl-padre-wx-vcs
)
options=(!emptydirs)
source=(git://github.com/PadreIDE/Padre.git)
_gitname=Padre
sha256sums=('SKIP')
install='perl-padre.install'
pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
build(){
  cd "$srcdir"/$_perlmod

### to prevent error:
#Unparsable version '6,59' for prerequisite ExtUtils::MakeMaker at inc/Module/Install/Makefile.pm line 352.
#unexpected end of string while parsing JSON string, at character offset 285 (before ","url":"http://modul...") at /usr/share/perl5/core_perl/CPAN/Meta/Converter.pm line 24.
# at /usr/share/perl5/core_perl/ExtUtils/MM_Any.pm line 824.
#ERROR from evaluation of /home/piecia/AUR-tmp/perl-padre/src/Padre-1.00/winxs/Makefile.PL: unexpected end of string while parsing JSON string, at character offset 14 (before ","url":"http://modul...") at /usr/share/perl5/core_perl/CPAN/Meta/Converter.pm line 24.
### setting locale to C

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  # If using Build.PL
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make test
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make install
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build install
  fi

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

  # Modifing the path to the program icon
  sed -i -e \
  's#Icon=/usr/local/share/perl/5.10.1/auto/share/dist/Padre/icons/padre/64x64/logo.png#Icon=padre#' \
      $pkgdir/usr/share/perl5/vendor_perl/auto/share/dist/Padre/padre.desktop

  # installing desktop file
  install -Dm644 $pkgdir/usr/share/perl5/vendor_perl/auto/share/dist/Padre/padre.desktop \
      $pkgdir/usr/share/applications/padre.desktop

  # installing icons
  for _dim in 16x16 64x64; do
    install -dm755 $pkgdir/usr/share/icons/hicolor/${_dim}/apps
    # symlinks to hicolor icons
    ln -s /usr/share/perl5/vendor_perl/auto/share/dist/Padre/icons/padre/${_dim}/logo.png \
      $pkgdir/usr/share/icons/hicolor/${_dim}/apps/padre.png
  done
}
