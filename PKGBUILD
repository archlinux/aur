# Maintainer: czyt <czytcn@gmail.com>
pkgname=velotype-bin
pkgver=0.4.9
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
sha256sums_x86_64=('0727386c9b4e5a72447cfc7428942dce508e471bfcc5d2c10341d69dc96df21e')
sha256sums_aarch64=('f7e00a2bbd75229b606dbcae9da44871427879f5184f89de735e6d2949120e1d')

package() {
    install -Dm755 velotype "${pkgdir}/usr/bin/velotype"
    install -Dm644 "share/applications/com.manyougz.Velotype.desktop" "${pkgdir}/usr/share/applications/com.manyougz.Velotype.desktop"
    install -Dm644 "share/icons/hicolor/512x512/apps/com.manyougz.Velotype.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.manyougz.Velotype.png"
    install -Dm644 "share/icons/hicolor/256x256/apps/com.manyougz.Velotype.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.manyougz.Velotype.png"
    install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
