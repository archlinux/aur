# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: examon <examon.mail[at]gmail[dot]com>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Dwight Schauer <dschauer@ti.com>

_pkgbase=pyudev
pkgname=('python2-pyudev')
pkgver=0.21.0
pkgrel=1
arch=('any')
url='http://pyudev.readthedocs.org/en/latest/index.html'
license=('LGPL')
pkgdesc='A pure Python 2.7 binding to libudev'
depends=('python2' 'systemd')
makedepends=('python2-setuptools')
optdepends=('python2-pyqt5: PyQt integration'
            'python2-gobject2: Glib integration'
            'python2-wxpython4: WX integration')
source=(https://github.com/pyudev/pyudev/archive/v$pkgver.tar.gz)

package_python2-pyudev() {
  cd ${_pkgbase}-${pkgver}
  python2 setup.py install --root "${pkgdir}" --optimize=1
}
sha512sums=('c6cc8786c69de2a07eeae39cb57e33db6ca5fea83c38fdab277070bf052c97bd053911ab08a11fe65cb56c463492111e74451801390d89dc7f00fd00e68bba19')
