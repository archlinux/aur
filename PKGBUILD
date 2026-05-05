# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=5.21.1
pkgrel=1
pkgdesc="A hyper-fast, extensible application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('833066dee2a482a1cb2506f2f723248fd4cd3dc0b5ef046c0643b1bed7242c74')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
