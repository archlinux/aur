# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="A hyper-fast, extensible application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('c6e863736c6af4d088ad8f0debf494b6cc5b87bbe21e1fd5d536183dfa651f16')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
