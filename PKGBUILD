# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-pyvirtualdisplay
pkgver=0.2.4
pkgrel=1
pkgdesc="Python wrapper for Xvfb, Xephyr and Xvnc"
arch=('any')
url="http://pyvirtualdisplay.readthedocs.io"
license=('BSD')
depends=('python2>=2.7' 'python2-easyprocess')
source=("https://files.pythonhosted.org/packages/source/P/PyVirtualDisplay/PyVirtualDisplay-${pkgver}.tar.gz")
sha256sums=('07f50759205adaeeb255a88be0ac1dce68da80686e6ca1fc362f4aa54fdbcb5b')

package() {
    cd "${srcdir}/PyVirtualDisplay-${pkgver}"

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
