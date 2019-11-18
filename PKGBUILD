# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-mpl
pkgver=0.11
pkgrel=1
pkgdesc="Pytest plugin to help with testing figures output from Matplotlib"
arch=('i686' 'x86_64')
url="https://github.com/matplotlib/pytest-mpl"
license=('BSD')
depends=('python-pytest' 'python-matplotlib' 'python-pillow' 'python-nose')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-mpl/pytest-mpl-${pkgver}.tar.gz")
md5sums=('13d1666d0ab80e42e4713a603ce6445d')

package() {
    cd ${srcdir}/pytest-mpl-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
