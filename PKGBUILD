# Maintainer: Ramdan Olii <developer@nyanpixel.my.id>
pkgname=whatsapp-ultra-fast-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight WhatsApp Web client built with Tauri and Rust for Linux."
arch=('x86_64')
url="https://github.com/ramdanolii14/WhatsappUltraFast"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
source=("whatsapp-ultra-fast-${pkgver}.pkg.tar.zst::https://github.com/ramdanolii14/WhatsappUltraFast/releases/download/${pkgver}/whatsapp-ultra-fast-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('481ae52c2991864b5f7b429ddaf3a35fb0bee3479fcaf9390f2c0bcd9e35c8a7')

package() {
    bsdtar -xf "${srcdir}/whatsapp-ultra-fast-${pkgver}.pkg.tar.zst" \
        -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.BUILDINFO' \
        --exclude='.CHANGELOG' \
        --exclude='.INSTALL'
}