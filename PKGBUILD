# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teamspeak3-lang-pt_br
pkgver=3.0.10.1a
pkgrel=1
pkgdesc="Brazilian Portuguese translation for TeamSpeak3"
arch=(any)
url="http://addons.teamspeak.com/directory/category/Translations.html"
license=('GPL')
depends=(teamspeak3)
makedepends=(unzip)
source=(teamspeak_pt_br_$pkgver.ts3_addon.zip::http://addons.teamspeak.com/directory/addon/download/Brazilian-Portuguese-translation.html)
md5sums=('757c891350014866e6cdde24d6b70898')

package() {
	install -dm755 "$pkgdir"/opt/teamspeak3/
	cp -a translations "$pkgdir"/opt/teamspeak3/
	cp -a styles "$pkgdir"/opt/teamspeak3/
}
