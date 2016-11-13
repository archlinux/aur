# Maintainer:	Radek Šmejdíř <mad.smrad@gmail.com>
# Contributor:	Michal Karas <largon at largon dot net>

pkgname=stardict-en-cz
pkgver=20161101
pkgrel=1
pkgdesc="GNU/FDL English-Czech dictionary for StarDict"
arch=(any)
url="http://slovnik.zcu.cz/"
license=('FDL')
md5sums=('48a987b9b585656cfed49734ab00cfa7')
source=(http://dl.cihar.com/slovnik/stable/stardict-english-czech-$pkgver.tar.gz)

package() {
	mkdir -p $pkgdir/usr/share/stardict/dic
	cd $srcdir/stardict-english-czech-$pkgver
	install -m 644 czech-english.dict.dz czech-english.idx czech-english.ifo \
		english-czech.dict.dz english-czech.idx english-czech.ifo \
		$pkgdir/usr/share/stardict/dic
}

