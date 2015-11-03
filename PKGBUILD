# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}
pkgver=0.9.4
pkgrel=1
pkgdesc='Simple text editor using Python and EFL'
arch=('any')
url='http://jeffhoogland.github.io/ePad/'
license=('GPL3')
depends=('python-efl' 'python-elmextensions')
source=("https://github.com/JeffHoogland/ePad/archive/$pkgver.tar.gz")
sha256sums=('203bbfe8486a525845caacf81d26061399e308366592f416d7479f226ba60cc0')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 epad "$pkgdir/usr/bin/epad"
  install -Dm644 epad.1 "$pkgdir/usr/share/man/man1/epad.1"
  install -Dm644 ePad.desktop "$pkgdir/usr/share/applications/ePad.desktop"
}
