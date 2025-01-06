# Maintainer: MYT1 <MYT1 @ .com>

pkgname=ttf-chillround-nerd-git
pkgver=3.200.r2.g1ccce93
pkgrel=1
pkgdesc='寒蝉全圆体半圆体nerd补丁版   '
arch=('any')
url='https://github.com/Warren2060/ChillRound'
license=('SIL-1.1')
source=("git+https://github.com/maoyaotang12/ttf-nerd-.git
")
sha256sums=('SKIP')

pkgver() {
    cd ttf-nerd-
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd ttf-nerd-
	install -Dm644 寒蝉半圆体NerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/寒蝉半圆体NerdFont-Regular.ttf"
	install -Dm644 寒蝉全圆体BoldNerdFontNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/寒蝉全圆体BoldNerdFontNerdFont-Regular.ttf"
	install -Dm644 寒蝉全圆体NerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/寒蝉全圆体NerdFont-Regular.ttf"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
