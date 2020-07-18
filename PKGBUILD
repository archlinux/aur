# Maintainer: 6543 <6543 at obermui dot de>
pkgname=i2p-openrc
pkgver=1
pkgrel=0
pkgdesc="i2p init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/i2p-openrc/"
license=('GPL3')
groups=()
depends=('i2p' 'openrc')
source=('i2p.initd')
sha1sums=('5e15a3066bf111e07fc8f8f8c385b54eafe5f960')

package() {
	install -Dm755 ${srcdir}/i2p.initd "$pkgdir"/etc/init.d/i2p
}
