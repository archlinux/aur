# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=topcoder-applet
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Topcoder applet for participating and practicing on topcoder competitive programming events"
arch=('x86_64')
url="https://www.topcoder.com/community/arena"
license=('unknown')
groups=()
depends=(jre8)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://topcoder.com/contest/arena/ContestAppletProd7.2.jnlp"
          "topcoder_logo.png"
          "topcoder-applet.desktop"
          "exception.sites")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
validpgpkeys=()
programname="ContestAppletProd7.2.jnlp"
logoname="topcoder_logo.png"
desktopname="topcoder-applet.desktop"

package() {
  mkdir -p $pkgdir/usr/bin/topcoder
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir$HOME/.java/deployment/security
  cp $programname $pkgdir/usr/bin/topcoder/$programname
  cp $logoname $pkgdir/usr/bin/topcoder/$logoname
  cp $desktopname $pkgdir/usr/share/applications
  cp exception.sites $pkgdir$HOME/.java/deployment/security
}

