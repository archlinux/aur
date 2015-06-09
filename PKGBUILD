# Maintainer: bitwave <aur [at] oomlu [d0t] de>
pkgname=boarding-party
pkgver=1
pkgrel=2
pkgdesc="Boarding Party is a fast paced old school style FPS written in Java"
arch=("any")
url="http://7dfps.com/?action=games&id=228"
groups=('games')
license=('unknown')
depends=('java-environment' 'bash')
provides=('boarding-party')
conflicts=('boarding-party')
source=('http://www.intrrpt.com/downloads/boarding-party.jar' boarding-party)
noextract=('boarding-party.jar')
md5sums=('fea397f8175e2d446a4a3a03c638553a'
         '751a26b048ec398e7b59b68c9bb36df2')

package() {
	cd "$srcdir"
	install -Dm 644 boarding-party.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
