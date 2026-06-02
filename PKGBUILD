# Maintainer: Ramdan Olii <developer@nyanpixel.my.id>
pkgname=whatsapp-ultra-fast-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight WhatsApp Web client built with Tauri and Rust for Linux."
arch=('x86_64')
url="https://github.com/ramdanolii14/WhatsappUltraFast"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-desktop-portal-kde' 'xdg-utils')
source=("whatsapp-ultra-fast-${pkgver}.pkg.tar.zst::https://github.com/ramdanolii14/WhatsappUltraFast/releases/download/${pkgver}/whatsapp-ultra-fast-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('be448b409936416160ad06d8e8e686ba4f456e8369286518884ce2b5afb0fe0e')

package() {
    bsdtar -xf "${srcdir}/whatsapp-ultra-fast-${pkgver}.pkg.tar.zst" \
        -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.BUILDINFO' \
        --exclude='.CHANGELOG' \
        --exclude='.INSTALL'
}