# Maintainer: RayZ3R0 <z3r069@tutanota.com>
pkgname=sonami-bin
pkgver=0.1.3
_upstream_ver=0.1.3
pkgrel=1
pkgdesc="A tauri music player (Binary)"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami"
license=('MIT')
provides=('sonami')
conflicts=('sonami')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'alsa-lib' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/RayZ3R0/sonami/releases/download/v${_upstream_ver}/Sonami_${_upstream_ver}_amd64.deb")
sha256sums=('c50624b5f760e273418c3db492ce380959c37cf830cddcdc55b260254223a06f')

package() {
    cd "${srcdir}"
    tar -xf data.tar.* -C "${pkgdir}"
}
