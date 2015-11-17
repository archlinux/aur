# Maintainer:	Radek Smejdir <mad.smrad@gmail.com>

pkgname=stardict-de-cz
pkgver=20150301
pkgrel=1
pkgdesc="GNU/FDL German-Czech dictionary for StarDict"
arch=(any)
depends=('stardict')
url="http://gnu.nemeckoceskyslovnik.cz/"
license=('FDL')
md5sums=('ef41d0ebf1d50d86492b171718f47dae')
source=(http://dl.cihar.com/slovnik/stable/stardict-german-czech-$pkgver.tar.gz)

package() {
	mkdir -p $pkgdir/usr/share/stardict/dic
	cd $srcdir/stardict-german-czech-$pkgver
	install -m 644 czech-german.dict.dz czech-german.idx czech-german.ifo \
		german-czech.dict.dz german-czech.idx german-czech.ifo \
		$pkgdir/usr/share/stardict/dic
}

