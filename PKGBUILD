# Maintainer: Scott-Nx <158021536 plus Scott-Nx at users dot noreply dot github dot com>

pkgname=quantumlauncher-bin
pkgver=0.4.2
pkgrel=3
pkgdesc="A simple, powerful Minecraft launcher"
arch=('x86_64')
url="https://github.com/Mrmayman/quantumlauncher"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
optdepends=('jre-openjdk: External Java Runtime for Minecraft Java')
provides=('quantumlauncher')
source=("${pkgname}-${pkgver}.zip::https://github.com/Mrmayman/quantumlauncher/releases/download/v${pkgver}/quantum_launcher_linux_x86_64.zip"
        "ql_logo_32x32.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/32x32/ql_logo.png"
        "ql_logo_128x128.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/128x128/ql_logo.png"
        "ql_logo_256x256.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/256x256/ql_logo.png"
        "ql_logo_512x512.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/512x512/ql_logo.png"
        "quantumlauncher.desktop")

sha256sums=('7ca878491e120b711e27d783110684ebdb4656ebb383b5d8c7520ae339110e42'
            '155505fc1c8e7139ee5b7e2c430c984dc54ac23ccaf3f67b2a1635bfd3f71fab'
            '9562d3780eae741c9c407cfde6873e9b54a36d148aefcc56733a0c482cf782b3'
            '51e20ef1e0c37128523be60ae5007694efb0914b8f097a2be1bd24055768df9f'
            '1f94c842893f9527a08484b5c621f3557a4ac414aeb378fef14dc89931426a61'
            'bb88863b48041d1b16b1349b0bb4bdfb15b7a017ef2f1e49af5f0a84a36a281c')

package() {
    install -Dm755 "${srcdir}/quantum_launcher" "${pkgdir}/usr/bin/quantumlauncher"
    install -Dm644 "${srcdir}/ql_logo_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/ql_logo_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/ql_logo_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/ql_logo_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/quantumlauncher.desktop" "${pkgdir}/usr/share/applications/quantumlauncher.desktop"
}
