# Maintainer: RayZ3R0 <z3r069@tutanota.com>
pkgname=sonami-bin
pkgver=0.1.1_alpha.10
_upstream_ver=0.1.1-alpha.10
pkgrel=1
pkgdesc="A tauri music player (Binary)"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami"
license=('AGPL3')
provides=('sonami')
conflicts=('sonami')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'alsa-lib' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/RayZ3R0/sonami/releases/download/v${_upstream_ver}/Sonami_${_upstream_ver}_amd64.deb")
sha256sums=('b22938410253c9bb191ae5428b1d77907c8860c469cfb549542be73662af58ce')

package() {
    cd "${srcdir}"
    tar -xf data.tar.* -C "${pkgdir}"
}
