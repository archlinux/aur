pkgname=python-filedate
_name=${pkgname#python-}
pkgver=2.0
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
sha256sums=('5d6104c298b6d398d6200a35f075610f22efd677c9f25b08d6c0d1809f4f2693')

package(){
    python -m installer --destdir="$pkgdir" "${_name}-$pkgver-py3-none-any.whl"
}
