# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Koushik Sahu <koushiksahu68@gmail.com>
pkgname=topcoder-applet
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="TopCoder applet for participating and practicing on TopCoder competitive programming events. All rights to the TopCoder applet are reserved by TopCoder, Inc."
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
          "topcoder-applet.desktop")
noextract=()
md5sums=('938ae37090f43dfc69ffe03efddf6f5c' 'e678ae8884b6b3a0d3a4fc4539b26a50' '64e45a763b70e950f716d7d81cd6435a')
validpgpkeys=()
programname="ContestAppletProd7.2.jnlp"
logoname="topcoder_logo.png"
desktopname="topcoder-applet.desktop"

package() {
  mkdir -p $pkgdir/usr/local/topcoder
  mkdir -p $pkgdir$HOME/.local/share/applications

  cp $programname $pkgdir/usr/local/topcoder
  cp $logoname $pkgdir/usr/local/topcoder

  cp $desktopname $pkgdir$HOME/.local/share/applications
  chmod +x $pkgdir$HOME/.local/share/applications/$desktopname 

}

