# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A hyper-fast, extensible application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('ae1e26cd8d44a8ff2f26b49b31e4f3048bf7d98f4cc46e9cefd94e23b365bb11')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
