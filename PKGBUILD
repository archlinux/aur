# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=quantumlauncher-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple, powerful Minecraft launcher"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Mrmayman/quantumlauncher"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
optdepends=('jre-openjdk: External Java Runtime for Minecraft Java')
provides=('quantumlauncher')
source=("ql_logo_32x32.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/32x32/ql_logo.png"
        "ql_logo_128x128.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/128x128/ql_logo.png"
        "ql_logo_256x256.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/256x256/ql_logo.png"
        "ql_logo_512x512.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/02c9e1ae25e9b22f98403e189ea6e44e4284d865/assets/icon/512x512/ql_logo.png"
        "quantumlauncher.desktop")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Mrmayman/quantumlauncher/releases/download/v${pkgver}/quantum_launcher_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/Mrmayman/quantumlauncher/releases/download/v${pkgver}/quantum_launcher_linux_aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::https://github.com/Mrmayman/quantumlauncher/releases/download/v${pkgver}/quantum_launcher_linux_arm32.tar.gz")

sha256sums=('155505fc1c8e7139ee5b7e2c430c984dc54ac23ccaf3f67b2a1635bfd3f71fab'
            '9562d3780eae741c9c407cfde6873e9b54a36d148aefcc56733a0c482cf782b3'
            '51e20ef1e0c37128523be60ae5007694efb0914b8f097a2be1bd24055768df9f'
            '1f94c842893f9527a08484b5c621f3557a4ac414aeb378fef14dc89931426a61'
            '71f7418e88aab8bc7f4da221fafa0a99e3b8058737eafa4bcbefec8f080bcc82')
sha256sums_x86_64=('26b564795f9c8c67ca2bbda7156d5df8cdc2a5dfeb98730dbccf90465c60052a')
sha256sums_aarch64=('4e941ab860b8f84ab6cb17611bd8624ee67a3a04646c3ed3c2fed6352eb263ab')
sha256sums_armv7h=('8495a83f5c27cc777318bd3380871bb65e000a6798a261a0a5cbc11d0abb8d00')

package() {
    install -Dm755 "${srcdir}/quantum_launcher" "${pkgdir}/usr/bin/quantumlauncher"
    install -Dm644 "${srcdir}/ql_logo_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/ql_logo_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/ql_logo_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/ql_logo_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/quantumlauncher.png"
    install -Dm644 "${srcdir}/quantumlauncher.desktop" "${pkgdir}/usr/share/applications/quantumlauncher.desktop"
}
