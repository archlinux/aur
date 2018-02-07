# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-xvfb
pkgver=1.1.0
pkgrel=1
pkgdesc="Pytest plugin to run Xvfb for tests"
arch=('i686' 'x86_64')
url="https://github.com/The-Compiler/pytest-xvfb"
license=('MIT')
depends=('python>=3.3' 'python-pytest>=2.8.1' 'python-pyvirtualdisplay>=0.2.1')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-xvfb/pytest-xvfb-${pkgver}.tar.gz")
md5sums=('0754da6fb2ed04cb1604eec8c0a3deea')

package() {
    cd ${srcdir}/pytest-xvfb-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
