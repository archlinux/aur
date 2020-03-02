# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=3.0.0
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('MIT')
depends=('zsh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('faeb0f2670bd77eb571240d4dd7dc207a6a45a5552bfab81a89666df500c6dd9')

package() {
    cd "$pkgname-$pkgver"

    install -vDm 644 ${pkgname}{,.plugin}.zsh -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
    install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
