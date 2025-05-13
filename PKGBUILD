pkgname=eblanfetch
pkgver=1.0
pkgrel=1
pkgdesc="Stupid fetch written in Python"
arch=('any')
url="https://github.com/dirolov/eblanfetch"
license=('MIT')
depends=('python')
source=("eblanfetch.py")
sha256sums=('bc7d3cfb9ab91b837deb58d9a091ecb7ec0509fc2f6063948067cc29faf21a46')

package() {
  install -Dm755 "$srcdir/eblanfetch.py" "$pkgdir/usr/bin/eblanfetch"
}
