# Maintainer: Ainola
# Contributor: Edgar Kalkowski
pkgname=lstree
pkgver=0.1
pkgrel=1
pkgdesc="ls in tree form"
arch=('any')
depends=('bash')
url="https://github.com/ErkiDerLoony/lstree"
license=('GPL3')
source=("https://github.com/ErkiDerLoony/lstree/archive/v${pkgver}.tar.gz")
sha256sums=('e18b1a6a08d82a56dffdaef8d2b31832f421ad6e37cb826977a81923ca242a1e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 lstree "$pkgdir"/usr/bin
}
