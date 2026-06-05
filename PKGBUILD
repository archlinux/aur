# Maintainer: Ramdan Olii <developer@nyanpixel.my.id>
pkgname=whatsapp-ultra-fast-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A lightweight WhatsApp Web client built with Tauri and Rust for Linux."
arch=('x86_64')
url="https://github.com/ramdanolii14/WhatsappUltraFast"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-utils' 'libnotify' 'xdg-user-dirs')
optdepends=('xdg-desktop-portal-kde: Portal support for KDE Plasma')
source=("whatsapp-ultra-fast-${pkgver}.pkg.tar.zst::https://github.com/ramdanolii14/WhatsappUltraFast/releases/download/${pkgver}/whatsapp-ultra-fast-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('4c55b35b41b5bb6ff4f33a0c87949a6bdcedb8b6db8abf6274b8df595b430d19')

package() {
    # logic
    bsdtar -xf "${srcdir}/whatsapp-ultra-fast-${pkgver}.pkg.tar.zst" \
        -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.BUILDINFO' \
        --exclude='.CHANGELOG' \
        --exclude='.INSTALL'
}