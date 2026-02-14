# Maintainer: YourName <your_email@example.com>
pkgname=zerone-ai-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="ZERONE AI Desktop Application - Intelligent Chat Interface"
arch=('x64')
url="https://github.com/b2-3c/ZERONE-AI"
license=('ISC')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'fuse2')
source=("https://github.com/b2-3c/ZERONE-AI/releases/download/v${pkgver}/ZERONE-AI-${pkgver}.AppImage")
sha256sums=('SKIP') # سنضع SKIP لتسهيل الأمر في أول مرة

package() {
    install -Dm755 "${srcdir}/ZERONE-AI-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/zerone-ai"
}
