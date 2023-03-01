pkgname="pymoldyn-bin"
pkgver="0.9.9"
pkgrel="1"
pkgdesc="A molecule viewer with cavity computation."
arch=("x86_64")
url="https://github.com/sciapp/pyMolDyn"
license=("MIT")
depends=()
makedepends=()
source=("http://pgi-jcns.fz-juelich.de/pub/downloads/software/pymoldyn_${pkgver}-1_amd64.deb")
sha256sums=("1f0a4c8b78ce36517ae5abdb7653b3d42a966edc8c9a7a6b21dfbd546a8ccff9")

package() {
    cd "${srcdir}" && \
    tar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"
}
