# Maintainer: MYT1 <MYT1 @ .com>

pkgname=ttf-chillround-nerd-git
pkgver=3.200.r1.gacbd88b
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
	install -Dm644 ChillRoundFBoldNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/ChillRoundFBoldNerdFont-Regular.ttf"
	install -Dm644 ChillRoundFRegularNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/ChillRoundFRegularNerdFont-Regular.ttf"
	install -Dm644 ChillRoundMNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/ChillRoundMNerdFont-Regular.ttf"
	install -Dm644 ChillLICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
