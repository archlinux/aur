pkgname=myscript
pkgver=1.0
pkgrel=1
pkgdesc="Simple script example"
arch=('any')
license=('MIT')
source=("myscript.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 myscript.sh "$pkgdir/usr/bin/myscript"
}
