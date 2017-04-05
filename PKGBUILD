# former Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: tze <tze@datalove.me>

pkgname=ttf-unifraktur
pkgver=20170319
pkgrel=1
pkgdesc='A set of open-source Fraktur fonts'
arch=('any')
url='http://unifraktur.sourceforge.net'
license=('custom')
source=('http://downloads.sourceforge.net/project/unifraktur/fonts/UnifrakturMaguntia.2017-03-19.zip'
        'http://downloads.sourceforge.net/project/unifraktur/fonts/UnifrakturCook.2013-08-25.zip')
md5sums=('f6a04d627263379c698e5781e9860d6d'
         'e93c4f39f7ce6642fdf7ebc3d8ab19fe')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir"/*/*.ttf "$pkgdir/usr/share/fonts/TTF"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$srcdir"/*Maguntia*/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-UnifrakturMaguntia"
	install -m644 "$srcdir"/*Cook*/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-UnifrakturCook"
	install -m644 "$srcdir"/*Cook*/OFL-FAQ.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FAQ"
}
