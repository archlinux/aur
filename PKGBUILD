pkgname=polomatrix
pkgver=1.0
pkgrel=1
pkgdesc="Matrix-style falling characters in Python"
arch=('any')
license=('MIT')
depends=('python')
source=("polomatrix.py")
noextract=("polomatrix.py")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/polomatrix.py" "$pkgdir/usr/bin/polomatrix"
}
