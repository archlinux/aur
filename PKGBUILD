# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=skype-lang-hu
pkgver=4.3.0.37
pkgrel=2
pkgdesc="Hungarian language files for skype"
url="http://www.urbalazs.hu/blog/index.php?cikk=6"
arch=('any')
license=('CCPL')
depends=("skype-legacy=$pkgver")
source=(http://www.urbalazs.hu/blog/uploads/skype_hu_$pkgver.tar.gz)
md5sums=('69301d841910604af7fdd1763551e1a2')


package() {
	mkdir -p "$pkgdir"/usr/share/skype/lang
	install -m 644 skype_hu.* "$pkgdir/usr/share/skype/lang"
}
