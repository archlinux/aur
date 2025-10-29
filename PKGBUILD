# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber-bin
pkgver=0.6.0
pkgrel=2
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
conflicts=('wayscriber' 'wayscriber-debug')
replaces=('wayscriber-debug')
source_x86_64=("wayscriber-v${pkgver}-linux-x86_64.tar.gz::https://github.com/devmobasa/wayscriber/releases/download/v${pkgver}/wayscriber-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('a2e47cc81bc10248e5388cccac9ed0001e63c0d17f0c4e8381824b3bee0205bd')

_tarball="wayscriber-v${pkgver}-linux-${CARCH}.tar.gz"

package() {
    tar -xzf "${srcdir}/${_tarball}" -C "${pkgdir}" --strip-components=1
}
