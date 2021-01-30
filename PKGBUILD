# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=otf-fandol
pkgver=0.3
pkgrel=2
pkgdesc='Four basic fonts for Chinese typesetting: Song, Hei, Kai, Fang'
license=('GPL3')
depends=()
makedepends=()
arch=('any')
url='https://www.ctan.org/pkg/fandol'
source=('http://mirrors.ctan.org/fonts/fandol.zip')
b2sums=('f2125af3ee7d5a25a693e439d53a7d3f65fbd01b435d0ef86ca59a3a8cfd9b5873ec727f9dd121f87ab19d493e3a5fa1150e1c68f6d3ada20c1097a93bdb9dd5')

package() {
	cd "$srcdir"
	install -d "$pkgdir"/usr/share{/fonts/OTF,/licenses/$pkgname}
	cp fandol/*.otf "$pkgdir/usr/share/fonts/OTF"
	cp fandol/COPYING "$pkgdir/usr/share/licenses/$pkgname"
}

