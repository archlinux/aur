# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A hyper-fast, scriptable application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/vanta/releases/download/v${pkgver}/vanta_${pkgver}_amd64.deb")
sha256sums=('0ec4ef027d83e96be6747ca7926de3250c1bd643601243933725e77cc8f9dacf')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
