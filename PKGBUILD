# Maintainer: Isaac Ganoung <inventor500@vivaldi.net>
pkgname=dictd-openrc
pkgver=1.0
pkgrel=0.1
pkgdesc="An openrc init script for dictd."
arch=('any')
url="https://github.com/inventor500/pkgbuilds"
license=('GPL')
depends=('openrc' 'dictd')
source=('dictd.initd')
b2sums=('dbdb38ef8e4b3f9fb0ca10591cec33df97730b30bfca91525c67178aa22edd9cd08f9f2f4d12af66a948aa06d1cff2650b33b16d85584991957fd979054d2c56')

package() {
	install -Dm755 ${srcdir}/dictd.initd "$pkgdir"/etc/init.d/dictd
}
