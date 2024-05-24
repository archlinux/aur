# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=wang-fonts
_pkgname=wangfonts
pkgver=1.3.0
pkgrel=1
pkgdesc='Chinese (Unicode) TrueType fonts by Dr. Hann-Tzong Wang'
url='https://code.google.com/archive/p/wangfonts/'

arch=('any')
license=('GPL-2.0+')
makedepends=('git')
source=(
	"http://wangfonts.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz"
)
b2sums=(
	'8114eb72f8cf0d0ddbc92cea7b6acdab9f6c14aa554e39c720d3ca29448743efa5974594776aa171173432fd100da2f3c367eccd11a32e3b38c51d0b0a425169'
)

package() {
	cd $_pkgname
	install -Dm644 -t "$pkgdir/usr/share/fonts/${_pkgname}" *.ttf
}
