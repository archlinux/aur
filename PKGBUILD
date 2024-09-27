# Maintainer: MYT1 <MYT1 @ .com>

pkgname=ttf-chillround-nerd
pkgver=3.200
pkgrel=1
pkgdesc='寒蝉全圆体nerd补丁版   '
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
	install -Dm644 ChillRoundBoldNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/ChillRoundBoldNerdFont-Regular.ttf"
	install -Dm644 ChillRoundMNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/ChillRoundMNerdFont-Regular.ttf"
	install -Dm644 ChillRoundRegularNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/ChillRound/ChillRoundRegularNerdFont-Regular.ttf"
	install -Dm644 ChillLICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
