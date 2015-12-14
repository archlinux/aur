# Maintainer: nochecksum <nochecksum at users dot noreply dot github dot com>
pkgname=motion-openrc
pkgver=20151214
pkgrel=1
pkgdesc="Motion init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/motion-openrc/"
license=('APACHE')
groups=()
depends=('motion' 'openrc')
source=('motion.initd'
	'motion.confd'
	'motion.install')
sha1sums=('edd184db94a7a7d2ae234aee9c5d345f9bff93e6'
	'd63ca2b78b3d6495f7954ba3fab90a62e9d520b1'
	'036741893df1c9dd00c1de53de9e004bc7c6a5fb')

package() {
	install -Dm755 ${srcdir}/motion.confd "$pkgdir"/etc/conf.d/motion
	install -Dm755 ${srcdir}/motion.initd "$pkgdir"/etc/init.d/motion
	install=motion.install
}
