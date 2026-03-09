# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="A hyper-fast, extensible application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('f0a613d658459c1609100f80cd596f8b36abfd03aeca806a238f14df91593a6b')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
