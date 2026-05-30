# Maintainer: Deji-Tech <deji@fundtracer.xyz>
pkgname=fundtracer-desktop-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="FundTracer - Blockchain Wallet Forensics Desktop App"
arch=('x86_64')
url="https://www.fundtracer.xyz"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'glib2' 'cairo' 'pango' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/Deji-Tech/fundtracer-by-dt/releases/download/v${pkgver}/fundtracer-desktop-${pkgver}-x86_64.tar.gz")
sha256sums=('a6f8b76c8e7fdfe765fa49d287f37a98abd8b32fea2ad6cff5c33ee292abe98b')

package() {
  install -Dm755 "${srcdir}/fundtracer-desktop-${pkgver}/fundtracer-desktop" "${pkgdir}/usr/bin/fundtracer-desktop"

  install -Dm644 "${srcdir}/fundtracer-desktop-${pkgver}/usr/share/applications/FundTracer.desktop" \
    "${pkgdir}/usr/share/applications/FundTracer.desktop"

  install -Dm644 "${srcdir}/fundtracer-desktop-${pkgver}/usr/share/icons/hicolor/512x512/apps/fundtracer-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/fundtracer-desktop.png"
}
