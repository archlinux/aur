pkgname=eblanfetch
pkgver=1.0
pkgrel=1
pkgdesc="Stupid fetch written in Python"
arch=('any')
url="https://github.com/dirolov/eblanfetch"
license=('MIT')
depends=('python')
source=("eblanfetch.py")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/eblanfetch.py" "$pkgdir/usr/bin/eblanfetch"
}
