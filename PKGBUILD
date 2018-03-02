# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: nochecksum <nochecksum at users dot noreply dot github dot com>
pkgname=gogs-openrc
pkgver=20180302
pkgrel=1
pkgdesc="Gogs init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/gogs-openrc/"
license=('GPL')
groups=()
depends=('gogs' 'openrc')
source=('gogs.initd::https://raw.githubusercontent.com/csmk/frabjous/master/www-apps/gogs/files/gogs.initd-r2'
	'gogs.install')
sha1sums=('5226a3e218f3a7ffc0e4ea8f77adc09b2482db95'
          '44b07c2af73a9641b6e9f217c7d8b7caa5a0e5dd')

package() {
	install -Dm755 ${srcdir}/gogs.initd "$pkgdir"/etc/init.d/gogs
	install=gogs.install
}
