pkgname=python-unalix-rev
_name=${pkgname#python-}
pkgdesc="Unalix is a library written in Python, it implements the specification used by the ClearURLs addon for removing tracking fields from URLs."
pkgver=0.9.1
pkgrel=2
arch=('any')
url="https://github.com/icealtria/unalix-rev"
license=('LGPL3')
makedepends=(python-installer)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('feb7c9ff79d0e4d37d2f8121b992a5b82a5f9d9426fff973b4c267280e8244aa')

package() {
    python -m installer --destdir="$pkgdir" ${_name//-/_}-${pkgver}-py3-none-any.whl
}
