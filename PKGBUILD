# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-healpy
pkgver=1.12.5
pkgrel=1
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.org"
license=('GPL')
depends=('python>=3.4' 'python-numpy>=1.5' 'python-matplotlib' 'python-astropy' 'cfitsio')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('941058d53c7f4938ff550b7108a74122')

package() {
    cd ${srcdir}/healpy-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
