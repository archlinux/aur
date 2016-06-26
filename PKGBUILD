# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='python2-appindicator'
pkgver='12.10.1'
pkgrel=1
pkgdesc="Provides Python bindings so that you can use libappindicator from a Python program"
arch=('x86_64')
url="https://launchpad.net/ubuntu/trusty/amd64/python-appindicator/12.10.1+13.10.20130920-0ubuntu4"
license=('GPL')
depends=('python2' 'libappindicator' 'python-gobject' 'glib2' 'gtk2')
source=("http://launchpadlibrarian.net/167351016/python-appindicator_12.10.1+13.10.20130920-0ubuntu4_amd64.deb")
md5sums=('fc44a0ca4734bfc56444c50fe8317c65')

prepare() {
	cd "${srcdir}"
	tar xf data.tar.xz
}
package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}/usr/lib/python2.7/site-packages/"
	cp -rf usr/lib/python2.7/dist-packages/* "${pkgdir}/usr/lib/python2.7/site-packages/"
	}
