# Maintainer: ry2x

pkgname=hyprcrop-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A fast, Hyprland-native screenshot tool written in Rust"
arch=('x86_64')
url="https://github.com/ry2x/hyprcrop"
license=('MIT')
depends=('slurp' 'wl-clipboard' 'hyprland' 'libnotify' 'pipewire')
provides=('hyprcrop')
conflicts=('hyprcrop')


source_x86_64=("hyprcrop-${pkgver}::${url}/releases/download/v${pkgver}/hyprcrop")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")

sha256sums=('7730947ada4144f1f707fa00247da2dca12e3ef8cb22c9939d42f032595a5e74')
sha256sums_x86_64=('927086648f68c255c2ed1dfe7e512195ce727566b1d3e0fa1b602bdabf89449f')

package() {
    install -Dm755 "${srcdir}/hyprcrop-${pkgver}" "${pkgdir}/usr/bin/hyprcrop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
