# Maintainer: Jonas Baumgardt <linuxus@mail.de>
pkgname='gqthres'
pkgver=1.0
pkgrel=1
pkgdesc="Resolver for Callsigns and Locators"
arch=(x86_64)
url="https://github.com/BaumGuard/gqthres"
license=('GPL')
depends=('jre-openjdk')
makedepends=()

package() {
	install -Dm755 ~/gqthres/gqthres "$pkgdir/usr/bin/gqthres"
	install -Dm755 ~/gqthres/gqthres.jar "$pkgdir/usr/lib/gqthres/gqthres.jar"
	install -Dm755 ~/gqthres/gqthres.conf "$pkgdir/etc/gqthres.conf"
	install -Dm755 ~/gqthres/gqthres.desktop "$pkgdir/usr/share/applications/gqthres.desktop"
	install -Dm755 ~/gqthres/gqthres.png "$pkgdir/usr/share/pixmaps/gqthres.png"
	install -Dm777 ~/gqthres/gqthres.log "$pkgdir/$HOME/.cache/gqthres/gqthres.log"
}
