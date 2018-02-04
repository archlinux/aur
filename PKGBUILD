# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-pyvirtualdisplay
pkgver=0.2.1
pkgrel=1
pkgdesc="Python wrapper for Xvfb, Xephyr and Xvnc"
arch=('any')
url="http://pyvirtualdisplay.readthedocs.io/en/latest/"
license=('BSD')
depends=('python2>=2.6', 'python2-easyprocess')
source=("https://files.pythonhosted.org/packages/source/P/PyVirtualDisplay/PyVirtualDisplay-${pkgver}.tar.gz")
sha256sums=('012883851a992f9c53f0dc6a512765a95cf241bdb734af79e6bdfef95c6e9982')

package() {
  cd "${srcdir}/PyVirtualDisplay-${pkgver}"
  install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
