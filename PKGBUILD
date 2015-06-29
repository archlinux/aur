# Maintainer:	Radek Šmejdíř <mad.smrad@gmail.com>
# Contributor:	Michal Karas <largon at largon dot net>

pkgname=stardict-en-cz
pkgver=20150201
pkgrel=1
pkgdesc="GNU/FDL English-Czech dictionary for StarDict"
arch=(any)
depends=('stardict')
url="http://slovnik.zcu.cz/"
license=('FDL')
md5sums=('43e57bf52b44d852edf94f62a7aaa094')
source=(http://dl.cihar.com/slovnik/stable/stardict-english-czech-$pkgver.tar.gz)

package() {
	mkdir -p $pkgdir/usr/share/stardict/dic
	cd $srcdir/stardict-english-czech-$pkgver
	install -m 644 czech-english.dict.dz czech-english.idx czech-english.ifo \
		english-czech.dict.dz english-czech.idx english-czech.ifo \
		$pkgdir/usr/share/stardict/dic
}

