pkgname="pymoldyn-bin"
pkgver="0.9.9"
pkgrel="3"
pkgdesc="A molecule viewer with cavity computation."
arch=("x86_64")
url="https://github.com/sciapp/pyMolDyn"
license=("MIT")
depends=()
makedepends=()
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("http://pgi-jcns.fz-juelich.de/pub/downloads/software/pymoldyn_${pkgver}-1_amd64.deb")
sha256sums=("581c449caefaaf3eba8c2aa8cdbedc6548e23203e8c88d2a23696d06107c7589")

package() {
    cd "${srcdir}" && \
    tar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"
}
