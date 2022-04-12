# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname="python-west"
_name=${pkgname##"python-"}
pkgdesc="Zephyr RTOS Project meta-tool"
pkgver=0.13.0
pkgrel=1
arch=("any")
url="https://pypi.org/project/west/"
license=("Apache")
depends=("python>=3.6"
         "python-colorama"
         "python-pyaml>=5.1"
         "python-pykwalify"
         "python-packaging")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=("8e53a678833a35f818ca48e182cecaa6701714c6d3fe5a5b4ff6c1689d82198e")
