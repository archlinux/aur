# Maintainer: 6543 <6543 at obermui dot de>

pkgname=i2p-openrc
pkgver=1.0
pkgrel=2
pkgdesc="i2p init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/i2p-openrc/"
license=('GPL3')
groups=()
depends=('i2p' 'openrc')
source=('i2p.initd')
sha1sums=('f51e4a8f6985f64b4ff7b719f33d4bc91ad1962e')

package() {
	install -Dm755 ${srcdir}/i2p.initd ${pkgdir}/etc/init.d/i2p
}
