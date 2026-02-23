# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=1.14.1
pkgrel=1
pkgdesc="A hyper-fast, scriptable application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('7dfcde1d63b7ad6dba8f0ba7415ebce876e8efdb08e2379d9c92e9fa9c7fafd0')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
