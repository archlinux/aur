# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Parser for D-Bus introspection XML and processing it in various ways'
pkgname=python-dbus-deviation
pkgver=0.6.0
pkgrel=1
url=https://github.com/pwithnall/dbus-deviation
arch=(any)
license=(LGPL)
depends=(python-lxml python-setuptools)
makedepends=(python-sphinx)
source=("https://files.pythonhosted.org/packages/1f/c3/0b4ea31404ff0e22e37ae3675687575061836b85bf18866a4a61f181e52f/dbus-deviation-0.6.0.tar.gz")
sha256sums=('cfbb3c906807d8376ae598bbc889b3a71992cdecc0637091d97ffcbcb69b7408')

package ()
{
	cd "dbus-deviation-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
