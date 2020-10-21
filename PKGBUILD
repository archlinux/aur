# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Radek Smejdir <mad.smrad@gmail.com>

pkgname=stardict-de-cz
pkgver=20200501
pkgrel=1
pkgdesc="GNU/FDL German-Czech dictionary for StarDict"
arch=('any')
url="http://gnu.nemeckoceskyslovnik.cz/"
license=('FDL')
source=(http://dl.cihar.com/slovnik/stable/stardict-german-czech-$pkgver.tar.gz)
sha256sums=('426d63d1389637af7fa57a7362ea5446b66856142b4daae87a3f7d455dbd21b5')

package() {
# 	mkdir -p $pkgdir/usr/share/stardict/dic
# 	cd $srcdir/stardict-german-czech-$pkgver
# 	install -m 644 czech-german.dict.dz czech-german.idx czech-german.ifo \
# 		german-czech.dict.dz german-czech.idx german-czech.ifo \
# 		$pkgdir/usr/share/stardict/dic


  cd "${srcdir}"/stardict-german-czech-$pkgver

  install -d "${pkgdir}"/usr/share/stardict/dic/
  install -m644 czech-german* german-czech* "${pkgdir}"/usr/share/stardict/dic/
}
