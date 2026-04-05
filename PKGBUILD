# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='zswapmon-bin'
pkgver='0.1.0'
pkgrel='1'
pkgdesc='Utility for monitoring zswap status and statistics'
arch=("x86_64")
url='https://github.com/VHSgunzo/zswapmon'
provides=("${pkgname}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=(
    "LICENSE::https://raw.githubusercontent.com/VHSgunzo/${pkgname%-bin}/refs/heads/main/LICENSE"
    "${pkgname%-bin}::https://github.com/VHSgunzo/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
