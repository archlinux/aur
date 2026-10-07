# Maintainer: Arthur McLain <mclain.it@gmail.com>
# Contributor: Nikhil Singh <nik.singh710@gmail.com>
pkgname=getnf
pkgver=0.4.0
pkgrel=1
pkgdesc='Command-line tool for installing Nerd Fonts'
url='https://github.com/getnf/getnf'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getnf/getnf/archive/v${pkgver}.tar.gz")
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('curl')
optdepends=('fzf: for "getnf -f" functionality')
sha256sums=('35f2e859e2e6e0a8ed30bb2b691e23cd9270f6fb64c330b72269eaca76658d9b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 getnf "$pkgdir/usr/bin/$pkgname"
  install -Dm644 man/getnf.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
