# Maintainer: aksr <aksr at t-com dot me>
pkgname=elm
pkgver=2.5.8
pkgrel=1
epoch=
pkgdesc="The Elm Mail System"
arch=('i686' 'x86_64')
url="http://www.instinct.org/elm/"
license=('custom: public domain')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('mailutils')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.instinct.org/elm/files/tarballs/$pkgname$pkgver.tar.gz"
        curses.patch
        mcprtlib.patch)
noextract=()
md5sums=('f7a721c1cddbc8632ffe0cf65b045395'
         '8ffcf3b55a35a20dc0bc9c651e57d288'
         '76a73fdb5ba02749332ee19aca493e13')
sha1sums=('bf09df75d0dc9097a1e69591bfb4872f860e00c7'
          '126c93238ada3ed3b92f904d86e88e87330895d6'
          'e65c141f04d2b8840d51228747c635cef0cf4c3d')
sha256sums=('80ec62197d214a6efcf19bb98eb64483a78f80956c1a77eab783bea1949ac815'
            '28bb176f2dbe1979c69c45b1509736904b61b9ee525f0910f6d2f975095dd92d'
            'c8c8c021a9feceec135e7bd186e7d1df0d1832f4eecbd3b33badd756e592a7b4')

prepare() {
  cd "$srcdir/$pkgname$pkgver/src"
  patch < "$srcdir/curses.patch"
  cd "$srcdir/$pkgname$pkgver/hdrs"
  patch < "$srcdir/mcprtlib.patch"
}

build() {
  cd "$srcdir/$pkgname$pkgver"
  ./Configure Log='' \
              Header='' \
              contains='' \
              cppstdin='' \
              cppminus='' \
              d_getopt='' \
              d_memcpy='' \
              d_mkdir='' \
              d_rename='' \
              d_symlink='' \
              d_whoami='' \
              n='' \
              c='' \
              orderlib='' \
              ranlib='' \
              package='' \
              pager='' \
              prefshell='' \
              startsh='' \
              d_eunice='' \
              define='' \
              eunicefix='' \
              build_dir='' \
              source_dir='' \
              loclist='' \
              expr='' \
              sed='' \
              echo='' \
              cat='' \
              rm='' \
              mv='' \
              cp='' \
              tail='' \
              tr='' \
              mkdir='' \
              sort='' \
              uniq='' \
              grep='' \
              trylist='' \
              test='' \
              inews='' \
              ispell='' \
              egrep='' \
              more='' \
              pg='' \
              Mcc='' \
              vi='/usr/bin/vi' \
              mailx='' \
              mail='' \
              cpp='' \
              perl='' \
              emacs='' \
              ls='' \
              rmail='' \
              sendmail='/usr/bin/sendmail' \
              shar='' \
              smail='' \
              submit='' \
              tbl='' \
              troff='/usr/bin/troff' \
              nroff='' \
              uname='' \
              uuname='' \
              line='' \
              chgrp='' \
              chmod='' \
              lint='' \
              sleep='' \
              pr='' \
              tar='' \
              ln='' \
              lpr='' \
              lp='' \
              touch='' \
              make='' \
              date='' \
              csh='' \
              pmake='' \
              mips='' \
              col='' \
              pack='' \
              bld='' \
              compress='' \
              execmail='' \
              libswanted='' \
              bin='' \
              installbin='/usr/bin' \
              c_date='' \
              d_ascii='' \
              d_broke_ctype='' \
              d_broke_fflush='' \
              d_calendar='' \
              calendar='' \
              d_chown_neg1='' \
              d_content='' \
              d_crypt='' \
              cryptlib='' \
              d_cuserid='' \
              d_disphost='' \
              d_domname='' \
              d_usegetdom='' \
              d_errlst='' \
              d_flock='' \
              d_dotlock='' \
              d_fcntlock='' \
              lock_dir='' \
              has_flock='' \
              has_fcntl='' \
              d_fsync='' \
              d_ftruncate='' \
              d_gethname='' \
              d_douname='' \
              d_host_comp='' \
              ign_hname='' \
              d_index='' \
              d_internet='' \
              d_ispell='' \
              ispell_path='' \
              ispell_options='' \
              d_locale='' \
              d_nl_types='' \
              d_msgcat='' \
              d_usenls='' \
              d_mboxedit='' \
              d_mime='' \
              defcharset='' \
              defdispcharset='' \
              d_mmdf='' \
              d_newauto='' \
              d_noaddfrom='' \
              d_usedomain='' \
              d_noxheader='' \
              d_pidcheck='' \
              d_ptem='' \
              d_putenv='' \
              d_remlock='' \
              maxattempts='' \
              d_setegid='' \
              d_setgid='' \
              d_savegrpmboxid='' \
              mailermode='' \
              d_sigvec='' \
              d_sigvectr='' \
              d_sigset='' \
              d_sighold='' \
              d_sigprocmask='' \
              d_sigblock='' \
              d_sigaction='' \
              d_statuschg='' \
              d_strcspn='' \
              d_strspn='' \
              d_strpbrk='' \
              d_strerror='' \
              d_strftime='' \
              d_strings='' \
              d_pwdinsys='' \
              strings='' \
              includepath='' \
              d_strstr='' \
              d_strtok='' \
              d_subshell='' \
              d_tempnam='' \
              tempnamo='' \
              tempnamc='' \
              d_termio='' \
              d_termios='' \
              d_useembed='' \
              d_utimbuf='' \
              d_vfork='' \
              defbatsub='' \
              defeditor='' \
              editoropts='' \
              hostname='' \
              phostname='' \
              mydomain='' \
              autohostname='' \
              i_memory='' \
              i_stdarg='' \
              i_stdlib='' \
              i_time='' \
              i_systime='' \
              d_systimekernel='' \
              i_unistd='' \
              i_utime='' \
              i_sysutime='' \
              lib='' \
              installlib='installlib' \
              libc='' \
              linepr='' \
              maildir='' \
              mailer='' \
              mailgrp='' \
              mansrc='' \
              catmansrc='' \
              manext='.1' \
              manext_choice='' \
              catmanext='' \
              catmanext_choice='' \
              packed='' \
              manroff='' \
              manroffopts='' \
              suffix='' \
              packer='' \
              models='' \
              split='' \
              small='' \
              medium='' \
              large='' \
              huge='' \
              optimize='' \
              ccflags='' \
              cppflags='' \
              ldflags='' \
              cc='' \
              libs='' \
              nametype='' \
              d_passnames='' \
              d_berknames='' \
              d_usgnames='' \
              passcat='' \
              rmttape='' \
              roff='' \
              roffopts='' \
              sigtype='' \
              spitshell='' \
              shsharp='' \
              sharpbang='' \
              termlib='' \
              tmpdir='' \
              tzname_handling='' \
              xencf='' \
              xenlf='' \
              d_xenix='' \
              d_bsd='' \
              CONFIG='' \
              package=elm-2.5 \
  make all
}

check() {
  cd "$srcdir/$pkgname$pkgver"
  make -k .CHECK
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  mkdir -p $pkgdir/usr/{bin,lib,/share/man/{man1,cat1}}
  make DEST="$pkgdir/usr" \
       LIB="$pkgdir/usr/lib/" \
       MAN="$pkgdir/usr/share/man/man1" \
       CATMAN="$pkgdir/usr/share/man/cat1" \
       DESTBIN="$pkgdir/usr/bin" \
       DESTLIB="$pkgdir/usr/lib/" install
  install -Dm644 doc/Alias.guide $pkgdir/usr/share/doc/$pkgname/Alias.guide
  install -Dm644 doc/Config.guid $pkgdir/usr/share/doc/$pkgname/Config.guid
  install -Dm644 doc/Form.guide  $pkgdir/usr/share/doc/$pkgname/Form.guide
  install -Dm644 doc/Ref.guide $pkgdir/usr/share/doc/$pkgname/Ref.guide
  install -Dm644 doc/Users.guide $pkgdir/usr/share/doc/$pkgname/Users.guide
}

