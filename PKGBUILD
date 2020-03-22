# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=barrier-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Open-source KVM software based on Synergy (GUI)"
arch=(x86_64)
url="https://github.com/debauchee/barrier"
license=("custom:GPL2WithOpenSSLException")
depends=(
    # Barrier core dependencies:
    curl
    avahi
    libx11
    libxrandr
    libxext
    libxinerama
    xorgproto
    libxtst
    libxi
    libsm
    libice
    openssl
)
makedepends=(
    cmake

    # Barrier GUI dependencies:
    qt5-base
    hicolor-icon-theme
)
provides=("barrier")
conflicts=("barrier")
options=(!emptydirs !makeflags !strip)
source=(
	https://github.com/dotiful/AUR/raw/master/barrier-bin/barrier-${pkgver}-${CARCH}.tar.xz
)
noextract=(barrier-${pkgver}-${CARCH}.tar.xz)

package() {
	tar -xf $srcdir/barrier-${pkgver}-${CARCH}.tar.xz -C $pkgdir --exclude=".*"
}

sha256sums=('e65088db4f282f01301e6ca4f1c829216cba50b07d01d1d42ed4c8a626e80da3')