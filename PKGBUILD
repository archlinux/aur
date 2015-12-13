# Maintainer: nochecksum <nochecksum at users dot noreply dot github dot com>
pkgname=gogs-openrc
pkgver=20151213
pkgrel=3
pkgdesc="Gogs init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/gogs-openrc/"
license=('APACHE')
groups=()
depends=('gogs' 'openrc')
source=('gogs.initd'
	'gogs.confd'
	'gogs.install')
sha1sums=('015eb99d4e052f3225c60255a65a0a486306ba30'
	'100e505266fcbc079c69e3cc28d285c2940db664'
	'44b07c2af73a9641b6e9f217c7d8b7caa5a0e5dd')

package() {
	install -Dm755 ${srcdir}/gogs.confd "$pkgdir"/etc/conf.d/gogs
	install -Dm755 ${srcdir}/gogs.initd "$pkgdir"/etc/init.d/gogs
	install=gogs.install
}
