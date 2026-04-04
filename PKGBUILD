# Maintainer:
# Contributor: Willem Herremans <whpgf at scarlet.be>

pkgname=tkpacman
pkgver=1.9.1
pkgrel=3
pkgdesc="A lightweight GUI for pacman built with Tcl/Tk"
arch=('any')
url="https://sourceforge.net/projects/tkpacman"
license=('GPL-2.0-only')

depends=(
  'tcl'
  'tk'
)
optdepends=(
  'sudo: if you want to use sudo instead of su'
  'kdesu: if you want to use kdesu instead of su or sudo'
  'xterm: alternative terminal emulator'
  'vte3: alternative terminal emulator'
  'xfce4-terminal: alternative terminal emulator'
  'mate-terminal: alternative terminal emulator'
  'konsole: alternative terminal emulator'
  'qterminal: alternative terminal emulator'
)

source=(https://downloads.sourceforge.net/tkpacman/tkpacman-$pkgver/tkpacman-$pkgver.tar.gz)
sha256sums=('d18659be3ae4d9cf3aadd75ce6d85b3621bc1395d55680a95d2a6258e2209560')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
}
