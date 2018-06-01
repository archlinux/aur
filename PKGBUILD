# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=eltoritopy
pkgver=20180418
pkgrel=2
pkgdesc="Python utility to extract eltorito images from bootable images"
url="https://github.com/enckse/eltorito"
depends=("python")
makedepends=("git")
arch=("any")
license=('MIT')
source=("git+$url#commit=a5674f1a1910cde8236a5b8fb72756cb07bfd629")
md5sums=('SKIP')

package() {
    cd "$srcdir/eltorito"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 755 eltorito.py "$pkgdir/usr/bin/eltoritopy"
}
