# Maintainer:	Radek Smejdir <mad.smrad@gmail.com>

pkgname=stardict-de-cz
pkgver=20150101
pkgrel=1
pkgdesc="GNU/FDL German-Czech dictionary for StarDict"
arch=(any)
depends=('stardict')
url="http://slovnik.hrach.eu/"
license=('FDL')
md5sums=('a275fc6960e00303877a0c159411958e')
source=(http://dl.cihar.com/slovnik/stable/stardict-german-czech-$pkgver.tar.gz)

package() {
	mkdir -p $pkgdir/usr/share/stardict/dic
	cd $srcdir/stardict-german-czech-$pkgver
	install -m 644 czech-german.dict.dz czech-german.idx czech-german.ifo \
		german-czech.dict.dz german-czech.idx german-czech.ifo \
		$pkgdir/usr/share/stardict/dic
}

