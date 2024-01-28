pkgname=python-filedate
_name=${pkgname#python-}
pkgver=3.0
pkgrel=1
pkgdesc='Simple, convenient and cross-platform file date changing library'
arch=('any')
url="https://github.com/kubinka0505/filedate"
license=('GPL-3-or-later')
depends=(
    python-dateutil
)
makedepends=(
    python-installer
)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name}-$pkgver-py3-none-any.whl")
sha256sums=('10af3be124bc17c041a4fb0381f7ab6761384be8f455e785936c9a8cf614dedb')

package(){
    python -m installer --destdir="$pkgdir" "${_name}-$pkgver-py3-none-any.whl"
}
