# Maintainer: bmgtjonas <linuxus@mail.de>
pkgname='gqthres'
pkgver=1.0
pkgrel=5
pkgdesc="Resolver for Callsigns and Locators"
arch=(x86_64)
url="https://github.com/BaumGuard/gqthres"
license=('GPL')
depends=('jre-openjdk')
makedepends=()

package() {
	cd ~
	git clone https://www.github.com/BaumGuard/gqthres
	install -Dm755 $HOME/gqthres/gqthres "$pkgdir/usr/bin/gqthres"
	install -Dm755 $HOME/gqthres/gqthres.jar "$pkgdir/usr/lib/gqthres/gqthres.jar"
	install -Dm755 $HOME/gqthres/gqthres.conf "$pkgdir/etc/gqthres.conf"
	install -Dm755 $HOME/gqthres/gqthres.desktop "$pkgdir/usr/share/applications/gqthres.desktop"
	install -Dm755 $HOME/gqthres/gqthres.png "$pkgdir/usr/share/pixmaps/gqthres.png"
	install -Dm777 $HOME/gqthres/gqthres.log "$pkgdir/$HOME/.cache/gqthres/gqthres.log"
}
