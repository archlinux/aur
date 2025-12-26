# Maintainer: PharmaRacist
pkgname=noon-python
pkgver=2.0.0
pkgrel=1
pkgdesc="Python dependencies for Noon desktop environment"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'python-click'
    'python-loguru'
    'python-psutil'
    'python-pywal16'
    'python-pywalfox'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "Python dependencies for Noon" > "$pkgdir/usr/share/doc/$pkgname/README"
}
