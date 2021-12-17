# Maintainer: Morten Linderud <morten@linderud.pw>
pkgname=tmux-resurrect
pkgver=3.0.0
pkgrel=1
pkgdesc="Persist tmux environment across system restarts."
arch=("any")
url="https://github.com/tmux-plugins/tmux-resurrect"
install=$pkgname.install
license=('MIT')
depends=('tmux' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tmux-plugins/tmux-resurrect/archive/v$pkgver.tar.gz")
sha256sums=('4c78cf50662d6868a0f398707bb0d6802697c93cbb3162fb8bf4b8e87b4e3b72')

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r * "${pkgdir}/usr/share/${pkgname}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
