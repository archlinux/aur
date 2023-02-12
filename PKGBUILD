# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_pkgauthor="chainner-org"
_pkgname="chainner"
pkgname="${_pkgname%}-rpm"
pkgver=0.17.1
pkgrel=2
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
url="https://github.com/chaiNNer-org/chaiNNer/"
license=('GPL3')
groups=()
depends=('libxcrypt-compat')
makedepends=()
optdepends=()
provides=("${_pkgname%}")
conflicts=()
replaces=()
backup=()
options=('!emptydirs' '!strip')
install=
changelog=
source=("https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64-linux-redhat.rpm")
noextract=()
sha512sums=('4b32d049bc2468062db574dc4cbcd144e9cd006d59f0e35f267cf077274e5a74bc70d3512d8d17eb93c5b9b0b7f52bce91a355c910ea78934e271dfacfff1338')

# build() {
# }

package() (
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/${_pkgname}/." "${pkgdir}/usr/lib/${_pkgname}/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
