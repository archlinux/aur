# Maintainer: czyt <czytcn@gmail.com>
pkgname=velotype-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Write at the speed of thought - high-performance native Markdown editor built with Rust and GPUI"
arch=('x86_64' 'aarch64')
url="https://github.com/manyougz/velotype"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=('velotype')
conflicts=('velotype')
source_x86_64=("velotype-v${pkgver}-linux-x86_64.tar.gz::https://github.com/manyougz/velotype/releases/download/v${pkgver}/velotype-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("velotype-v${pkgver}-linux-aarch64.tar.gz::https://github.com/manyougz/velotype/releases/download/v${pkgver}/velotype-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('34e84a462861a3d620eddd10a6e33c8f5a82ffb5cff6fd60eb1aaa776a923efb')
sha256sums_aarch64=('28b8d94c71c27d354f9be41bae94cc2c6e58add5c0fa1f124342800f945764ac')

package() {
    install -Dm755 velotype "${pkgdir}/usr/bin/velotype"
    install -Dm644 "share/applications/com.manyougz.Velotype.desktop" "${pkgdir}/usr/share/applications/com.manyougz.Velotype.desktop"
    install -Dm644 "share/icons/hicolor/512x512/apps/com.manyougz.Velotype.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.manyougz.Velotype.png"
    install -Dm644 "share/icons/hicolor/256x256/apps/com.manyougz.Velotype.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.manyougz.Velotype.png"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
