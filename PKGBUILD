# Maintainer: RayZ3R0 <z3r069@tutanota.com>
pkgname=sonami-bin
pkgver=0.1.2
_upstream_ver=0.1.2
pkgrel=1
pkgdesc="A tauri music player (Binary)"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami"
license=('AGPL3')
provides=('sonami')
conflicts=('sonami')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'alsa-lib' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/RayZ3R0/sonami/releases/download/v${_upstream_ver}/Sonami_${_upstream_ver}_amd64.deb")
sha256sums=('6508aad65d5adf15f0348150545aa44b17b70c294b7596c00c8e2a2fd0cf6843')

package() {
    cd "${srcdir}"
    tar -xf data.tar.* -C "${pkgdir}"
}
