# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=python-ditail
_pkgname=ditail
pkgver=0.1.0
pkgrel=1
pkgdesc="Tail for directories"
arch=("any")
url="https://github.com/ASzc/$_pkgname"
license=("GPL")
depends=("python-pyinotify")
options=(!emptydirs)
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=("994e2f5bfd895e2b160518069ebc3c372efdd51a174c73341b93d23f2a502390")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
