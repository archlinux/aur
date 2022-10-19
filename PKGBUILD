# Maintainer: Morten Linderud <morten@linderud.pw>
pkgname=tmux-resurrect
pkgver=4.0.0
pkgrel=1
pkgdesc="Persist tmux environment across system restarts."
arch=("any")
url="https://github.com/tmux-plugins/tmux-resurrect"
install=$pkgname.install
license=('MIT')
depends=('tmux' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tmux-plugins/tmux-resurrect/archive/v$pkgver.tar.gz")
sha256sums=('f8559d86d81be769054d63b28a268229a09bc6cc311f0623656c3090ec781b76')

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r * "${pkgdir}/usr/share/${pkgname}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
