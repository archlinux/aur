# Maintainer: Alesar1

pkgname=python-sds011
pkgver=0.2.0
pkgrel=1
pkgdesc="A python 3 interface to a sds011 fine dust sensor"
arch=('any')
url="https://pypi.org/project/sds011"
license=('GPL')
depends=(python-build python-installer python-wheel python-pyserial)

source=("https://files.pythonhosted.org/packages/36/a7/7b110ebe174316ea461ee53b6890e7a2b932e80c46d0f0f116fde4ab6f25/sds011-${pkgver}-py3-none-any.whl")
sha256sums=('21e284722dd1f152bd91de7bd2153a66748b5661f1a59f74d7b218b08609dfb9')


package() {
    cd $srcdir
    python -m installer --destdir="$pkgdir" sds011-${pkgver}-py3-none-any.whl
}
