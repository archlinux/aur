# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-healpy
pkgver=1.12.9
pkgrel=1
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
depends=('python>=3.4' 'python-numpy>=1.5' 'python-matplotlib' 'python-astropy' 'cfitsio' 'healpix')
makedepends=('cython>=0.16')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('9c1a5ae49b95b6fdbaf352ac8182b9b8')

package() {
    cd ${srcdir}/healpy-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
