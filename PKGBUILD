# Author: SanskritFritz (gmail)

pkgname=wuala-daemon
pkgver=20140719
pkgrel=1
pkgdesc="Run wuala as daemon. Needs wuala installed."
arch=('any')
url='http://www.wuala.com/'
license=('WTFPL')
depends=('wuala')
source=('wualad.conf' 'wuala.service')
backup=(etc/conf.d/wualad)
install='wualad.install'

package() {
	cd "$srcdir"
	install -Dm700 wualad.conf "$pkgdir/etc/conf.d/wualad"
	install -Dm644 wuala.service "$pkgdir/usr/lib/systemd/system/wuala.service"
}

md5sums=('1a9172cd02d468f80e74f6d7e3b76b6c'
         '446a111e8440877096137cc90211950f')
