# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=trayscale-bin
pkgver=0.18.9
pkgrel=1
pkgdesc="Unofficial GUI wrapper for the Tailscale CLI client (prebuilt)"
arch=('x86_64')
url="https://github.com/DeedleFake/trayscale"
license=('MIT')
depends=('gtk4' 'libadwaita' 'hicolor-icon-theme')
optdepends=('tailscale: provides the daemon that manages the connection')
provides=('trayscale')
conflicts=('trayscale')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('1b24f332a64a682e972e94fecfc11a7d719a1c74c5fd897c45c08cbd17d0ae93')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
