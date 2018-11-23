# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-doctestplus
pkgver=0.2.0
pkgrel=1
pkgdesc="Pytest plugin that provides advanced features for testing example code in documentation"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pytest-doctestplus"
license=('BSD')
depends=('python-pytest>=2.8.0' 'python-six' 'python-numpy>=1.10')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-doctestplus/pytest-doctestplus-${pkgver}.tar.gz")
md5sums=('1ab4e8b08e2de65250c95f11574cab71')

package() {
    cd ${srcdir}/pytest-doctestplus-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
