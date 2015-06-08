# Maintainer : chris_L <echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'>

pkgname=static_update
pkgver=1.0
pkgrel=1
pkgdesc="Ruby based DNS updater for www.StaticCling.org"
arch=('any')
url="http://staticcling.org"
license=('unknown')
depends=('ruby')
source=(http://code.martini.nu/staticcling/raw-file/tip/bin/staticcling-client)
md5sums=('07e65869e7a79c476e1fb85f784554ae')

package() {
	install -Dm755 staticcling-client $pkgdir/usr/bin/staticcling-client
}
