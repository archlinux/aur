# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-sphinx-astropy
pkgver=1.0
pkgrel=1
pkgdesc="Sphinx extensions and configuration specific to the Astropy project"
arch=('i686' 'x86_64')
url="https://github.com/astropy/sphinx-astropy"
license=('BSD')
depends=('python-sphinx>=1.4' 'python-astropy-sphinx-theme' 'python-sphinx-automodapi' 'python-sphinx-gallery' 'python-numpydoc')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/sphinx-astropy/sphinx-astropy-${pkgver}.tar.gz")
md5sums=('4d43b57e439a0e5c42536043a0ca69e8')

package() {
    cd ${srcdir}/sphinx-astropy-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
