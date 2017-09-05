# Maintainer: Morten Linderud <morten@linderud.pw>
pkgname=tmux-resurrect
pkgver=2.4.0
pkgrel=3
pkgdesc="Persist tmux environment across system restarts."
arch=("any")
url="https://github.com/tmux-plugins/tmux-resurrect"
install=$pkgname.install
license=('MIT')
depends=('tmux' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tmux-plugins/tmux-resurrect/archive/v$pkgver.tar.gz")
sha256sums=("801b9099f3ee891baea39a239c82cbc3a9c9f1a62c1b867a78bc1bfbfd506ce5")

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r * "${pkgdir}/usr/share/${pkgname}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
