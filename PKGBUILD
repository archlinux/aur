# Maintainer: RayZ3R0 <z3r069@tutanota.com>
pkgname=sonami-bin
pkgver=0.1.11
_upstream_ver=0.1.11
pkgrel=1
pkgdesc="A tauri music player (Binary)"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami"
license=('MIT')
provides=('sonami')
conflicts=('sonami')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'alsa-lib' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/RayZ3R0/sonami/releases/download/v${_upstream_ver}/Sonami_${_upstream_ver}_amd64.deb")
sha256sums=('ce203320e8e9fe409c73322f568d8e07fcace786798cf3852a122a3edf259e5c')

package() {
    cd "${srcdir}"
    tar -xf data.tar.* -C "${pkgdir}"
}
