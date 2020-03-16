# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=3.1.1
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('MIT')
depends=('zsh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0b2f2ba163bf448684fd556102b770ebe8c177b0b69e04b7853718bc87982409')

package() {
    cd "$pkgname-$pkgver"

    install -vDm 644 ${pkgname}{,.plugin}.zsh -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
    install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
