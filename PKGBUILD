# Maintainer: Deji-Tech <deji@fundtracer.xyz>
pkgname=fundtracer-desktop-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="FundTracer - Blockchain Wallet Forensics Desktop App"
arch=('x86_64')
url="https://www.fundtracer.xyz"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'glib2' 'cairo' 'pango' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/Deji-Tech/fundtracer-by-dt/releases/download/v${pkgver}/fundtracer-desktop-${pkgver}-x86_64.tar.gz")
sha256sums=('7803c08eac4361f547ae6ca635d3576c034c34a4ecb2dfa18e3dc82a4387c82f')

package() {
  install -Dm755 "${srcdir}/fundtracer-desktop-${pkgver}/fundtracer-desktop" "${pkgdir}/usr/bin/fundtracer-desktop"

  install -Dm644 "${srcdir}/fundtracer-desktop-${pkgver}/usr/share/applications/FundTracer.desktop" \
    "${pkgdir}/usr/share/applications/FundTracer.desktop"

  install -Dm644 "${srcdir}/fundtracer-desktop-${pkgver}/usr/share/icons/hicolor/512x512/apps/fundtracer-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/fundtracer-desktop.png"
}
