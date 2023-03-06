pkgname="pymoldyn-bin"
pkgver="0.9.9"
pkgrel="4"
pkgdesc="A molecule viewer with cavity computation."
arch=("x86_64")
url="https://github.com/sciapp/pyMolDyn"
license=("MIT")
depends=()
makedepends=()
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("http://pgi-jcns.fz-juelich.de/pub/downloads/software/pymoldyn_${pkgver}-1_amd64.deb")
sha256sums=("11eecd3d0c35aaa1d71a61519e0de5fc7b4e2b0a8d290cecc819b969426b2d4f")

package() {
    cd "${srcdir}" && \
    tar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"
}
