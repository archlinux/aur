# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors (prebuilt binaries)'
arch=('x86_64')
url='https://wayscriber.com'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
    'gcc-libs'
    'glibc'
    'wl-clipboard'
    'grim'
    'slurp'
)
provides=('wayscriber' 'wayscriber-configurator')
conflicts=('wayscriber')
source_x86_64=("wayscriber-v${pkgver}-linux-x86_64.tar.gz::https://github.com/devmobasa/wayscriber/releases/download/v${pkgver}/wayscriber-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('362252b013d273faf0b834addae3c06095c829c3948a0c9aa18d4b6afd8af29d')

_tarball="wayscriber-v${pkgver}-linux-${CARCH}.tar.gz"

package() {
    tar -xzf "${srcdir}/${_tarball}" -C "${pkgdir}" --strip-components=1
}
