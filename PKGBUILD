# Maintainer: corecathx <corecathx@proton.me>
pkgname=legacy-launcher
pkgver=latest
pkgrel=1
pkgdesc="Stable, fast and simple Minecraft Launcher."
arch=('any')
url="https://llaun.ch"
license=('Other')
depends=('java-runtime')
source=("LegacyLauncher_legacy.jar::https://dl.llaun.ch/legacy/bootstrap"
        "legacy-launcher"
        "legacy-launcher.desktop"
        "legacy-launcher.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}/"
    install -Dm755 "${srcdir}/legacy-launcher" "${pkgdir}/usr/bin/legacy-launcher"
    install -Dm644 "${srcdir}/legacy-launcher.desktop" "${pkgdir}/usr/share/applications/legacy-launcher.desktop"
    install -Dm644 "${srcdir}/LegacyLauncher_legacy.jar" "${pkgdir}/usr/share/legacy-launcher/LegacyLauncher_legacy.jar"
    install -Dm644 "${srcdir}/legacy-launcher.png" "${pkgdir}/usr/share/pixmaps/legacy-launcher.png"
}