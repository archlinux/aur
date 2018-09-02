# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-healpy
pkgver=1.12.4
pkgrel=1
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.org"
license=('GPL')
depends=('python>=3.4' 'python-numpy>=1.5' 'python-matplotlib' 'python-astropy' 'cfitsio')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('b20a3c35beaff37af4bc85766bc76944')

package() {
    cd ${srcdir}/healpy-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
