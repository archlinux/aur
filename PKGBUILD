# Maintainer: bitwave <aur [aTt] oomlu [d0t] de>
pkgname='ttf-firacode'
pkgdesc='Open Source monospaced font with programming ligatures'
pkgver=0.5
pkgrel=1
arch=('any')
license=('custom:OFL')
url='https://github.com/tonsky/FiraCode'
source=("https://github.com/tonsky/FiraCode/releases/download/${pkgver}/FiraCode-Regular.ttf")
sha512sums=('3ceeea1432f090be2393629007c0818dd154125006d8f291e924ff69a3e6d758f32916c13a8c36a87c39af210b9697437a8b6cc1430ebaf9233bc9bde6a63697')

package () {
	install -Dm644 "FiraCode-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/FiraCode-Regular.ttf"
}