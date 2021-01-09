# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=4.2.0
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('MIT')
depends=('zsh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('136b3e473d1106ea4746c5e92a9c44fa439875ac8b6598c5259d969f82735094')

package() {
    cd "$pkgname-$pkgver"

    install -vDm 644 ${pkgname}{,.plugin}.zsh -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
    install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
