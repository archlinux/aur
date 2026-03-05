# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="A hyper-fast, scriptable application launcher and command palette for Wayland (Spotlight alternative)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/Vanta/releases/download/v${pkgver}/Vanta_${pkgver}_amd64.deb")
sha256sums=('996269664e5822694a37e3ca32b15c4daa9547571153b7aee1fcbff8a9ced22a')

package() {
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
