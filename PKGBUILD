# Maintainer: Abdulrahman <abdualrhman6296@gmail.com>
pkgname=servhub
pkgver=1.0.0
pkgrel=1
pkgdesc="ServHub - A fast Linux app store powered by Flathub"
arch=('x86_64')
url="https://github.com/B5aaR/servhub-store"
license=('MIT')
depends=('flatpak')
source=("https://github.com/B5aaR/servhub-store/releases/download/v${pkgver}/ServHub-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/ServHub-${pkgver}.AppImage" "${pkgdir}/usr/bin/servhub"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/servhub.desktop" << DESK
[Desktop Entry]
Name=ServHub
Comment=Linux App Store powered by Flathub
Exec=servhub
Icon=servhub
Type=Application
Categories=System;
DESK
}
