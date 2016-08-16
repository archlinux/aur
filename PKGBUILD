# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=otf-fandol
pkgver=0.3
pkgrel=1
pkgdesc='Four basic fonts for Chinese typesetting: Song, Hei, Kai, Fang'
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
arch=('any')
url='http://www.ctan.org/pkg/fandol'
source=('http://mirrors.ctan.org/fonts/fandol.zip')
install=$pkgname.install
md5sums=('a9952cb42499179e110550d867219da0')

package() {
	cd "$srcdir"
	install -d "$pkgdir"/usr/share{/fonts/OTF,/licenses/$pkgname}
	cp fandol/*.otf "$pkgdir/usr/share/fonts/OTF"
	cp fandol/COPYING "$pkgdir/usr/share/licenses/$pkgname"
}

