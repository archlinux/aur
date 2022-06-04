# Maintainer: Kuna <kunamech@protonmail.ch>

pkgname=stardict-tr-2011
pkgver=2.4.2
pkgrel=1
pkgdesc="Turkish Language Association's Turkish dictionary (2011) for Stardict"
arch=('any')
license=('custom:public domain')
optdepends=('stardict: view the dictionary'
            'sdcv: view the dictionary in CLI')
url="https://github.com/kunamech/stardict-con/"
md5sums=('1647f6ddf7a42b16253f2bb2fba4bb7d')

source=('https://github.com/kunamech/stardict-con/raw/master/dist/guncel-turkce-sozluk_turk-dil-kurumu-2011/stardict-guncel-turkce-sozluk_turk-dil-kurumu-2011.tar.gz')

package() {
	mkdir -vp "$pkgdir/usr/share/stardict/dic/tdk-2011" "$pkgdir/usr/share/licenses/stardict-tr-2011";
  cp -vf "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/stardict-tr-2011";
  cd "$srcdir/dic/Güncel Türkçe Sözlük - Türk Dil Kurumu 2011";
  install -m 644 *.dict *.idx *.ifo "$pkgdir/usr/share/stardict/dic/tdk-2011";
}

# vim:set ts=2 sw=2 et:
