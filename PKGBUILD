# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=2.0
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL')
depends=('firefox')
makedepends=('git')
source=("https://github.com/girst/LegacyFox/releases/download/v$pkgver/$pkgname.tar.gz")
noextract=("$pkgname.tar.gz")
sha256sums=('44ce5bca375e92e1d7ec58a78326deac3e67ac044b42e40892f5b18087e0c95b')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/lib/firefox"
  tar xzf "$pkgname.tar.gz" -C "$pkgdir/usr/lib/firefox"
}
