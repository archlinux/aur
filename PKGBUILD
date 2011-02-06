# Maintainer: Bartek Piotrowski <barthalion@gmail.com>

pkgname=gtimelog
pkgver=0.5.0
pkgrel=1
pkgdesc="Small Gtk+ app for keeping track of my time and producing daily/weekly activity reports"
arch=(i686 x86_64)
url="http://mg.pov.lt/gtimelog/"
license=(GPL)
depends=('python2' 'pygtk')
makedepends=('setuptools')
optdepends=('dbus-python: made GTimeLog a single instance application')
source=(http://pypi.python.org/packages/source/g/gtimelog/gtimelog-${pkgver}.tar.gz)
md5sums=('b87ee06eaefc6762d17e6380b163c755')

build() {
    cd ${pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir}
}
