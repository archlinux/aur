# Maintainer: Deji-Tech <deji@fundtracer.xyz>
pkgname=fundtracer-desktop-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="FundTracer - Blockchain Wallet Forensics Desktop App"
arch=('x86_64')
url="https://www.fundtracer.xyz"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'glib2' 'cairo' 'pango' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/Deji-Tech/fundtracer-by-dt/releases/download/v${pkgver}/fundtracer-desktop-${pkgver}-x86_64.tar.gz")
sha256sums=('4ff2557007cd7576e12f9c8b3f167e19e88b7fb11aa3cf9335c8cf932e0c0405')

package() {
  install -Dm755 "${srcdir}/fundtracer-desktop-${pkgver}/fundtracer-desktop" "${pkgdir}/usr/bin/fundtracer-desktop"

  install -Dm644 "${srcdir}/fundtracer-desktop-${pkgver}/usr/share/applications/FundTracer.desktop" \
    "${pkgdir}/usr/share/applications/FundTracer.desktop"

  install -Dm644 "${srcdir}/fundtracer-desktop-${pkgver}/usr/share/icons/hicolor/512x512/apps/fundtracer-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/fundtracer-desktop.png"
}
