# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=2.1.1
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('MIT')
depends=('zsh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a8ee1b237a3b51ab8974540e937d9c6c9fd11dad15194b600830abdaf2bd7916')

package() {
    cd "$pkgname-$pkgver"

    install -vDm 644 ${pkgname}{,.plugin}.zsh -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
    install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
