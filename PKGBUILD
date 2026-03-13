# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=5.8.0
pkgrel=1
pkgdesc="A hyper-fast, extensible application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('29c2fc641a43283ecb541ff095af5959baa302c1e93250c3f2444a3c47441b3e')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
