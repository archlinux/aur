# Maintainer: Wyrex <wyrex@openmailbox.org>
pkgname=i2pd-openrc
pkgver=20160709
pkgrel=1
pkgdesc="i2pd init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/i2pd-openrc/"
license=('BSD')
groups=()
depends=('i2pd-git' 'openrc')
source=('i2pd.initd'
	'i2pd.confd')
md5sums=('5c7fe0e1982e8d0ea69b7a157d6c23e3'
         'b549d534c16243a0cbce382b312fd39c')

package() {
	install -Dm755 ${srcdir}/i2pd.confd "$pkgdir"/etc/conf.d/i2pd
	install -Dm755 ${srcdir}/i2pd.initd "$pkgdir"/etc/init.d/i2pd
  	install=i2pd.install
}
