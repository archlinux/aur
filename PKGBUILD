# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-astropy
pkgver=0.2.1
pkgrel=1
pkgdesc="Metapackage for all the testing machinery used by the Astropy Project"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pytest-astropy"
license=('BSD')
depends=('python-pytest' 'python-pytest-remotedata' 'python-pytest-doctestplus' 'python-pytest-openfiles' 'python-pytest-arraydiff')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-astropy/pytest-astropy-${pkgver}.tar.gz")
md5sums=('5b84af93e0e126d156060eae3f5f922b')

package() {
    cd ${srcdir}/pytest-astropy-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
