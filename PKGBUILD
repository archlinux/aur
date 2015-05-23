# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=ePad
pkgname=${_pkgname,,}
pkgver=0.9.0
pkgrel=1
pkgdesc='Simple text editor using Python and EFL'
arch=('any')
url='http://jeffhoogland.github.io/ePad/'
license=('GPL3')
depends=('python-efl' 'python-elmextensions')
source=("https://github.com/JeffHoogland/ePad/archive/$pkgver.tar.gz")
sha256sums=('b4a0f164d40de6796887f3ed43699d20f3cd2cc31cdd7a9cc33e7ce59aab16df')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 epad "$pkgdir/usr/bin/epad"
  install -Dm644 epad.1 "$pkgdir/usr/share/man/man1/epad.1"
}
