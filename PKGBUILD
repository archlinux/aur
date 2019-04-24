# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-mpl
pkgver=0.10
pkgrel=1
pkgdesc="Pytest plugin to help with testing figures output from Matplotlib"
arch=('i686' 'x86_64')
url="https://github.com/matplotlib/pytest-mpl"
license=('BSD')
depends=('python>=3.3' 'python-pytest' 'python-matplotlib' 'python-nose')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-mpl/pytest-mpl-${pkgver}.tar.gz")
md5sums=('eaf812561972f3aa3d4e1f1c077ba848')

package() {
    cd ${srcdir}/pytest-mpl-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
