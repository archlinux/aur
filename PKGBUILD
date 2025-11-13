# Maintainer: Anonymous
pkgname=myrosary
pkgver=1.0.1
pkgrel=1
pkgdesc="A command-line Rosary prayer assistant written in Python."
arch=('any')
url="https://github.com/miapata/myrosary"
license=('MIT')  # or whatever applies
depends=('python')
source=("$pkgname")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
