# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
_pkgname=quickgui
pkgname=$_pkgname-bin
pkgver=1.2.10
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('GPL')
depends=('quickemu' 'zenity')
options=('!strip' '!emptydirs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/quickemu-project/quickgui/releases/download/1.2.10/quickgui-1.2.10+1-linux.deb")
sha256sums=('506313e580e069b7c2daf8594fcaf00a44bc49e5785102f6ac359eaa20c3c193')

package() {
  tar -xf data.tar.zst -C "$pkgdir"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/usr/share/quickgui/quickgui" "${pkgdir}/usr/bin/quickgui"
}
