# Maintainer: Jingu <xiuluo dot android at gmail dot com>
# Contributor: Daniel Souza <aur at posix dot dev dot br>
_pkgauthor="chainner-org"
_pkgname="chainner"
pkgname="${_pkgname}-bin"
pkgver=0.18.6
pkgrel=1
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
url="https://github.com/chaiNNer-org/chaiNNer/"
license=('GPL3')
groups=()
depends=('libxcrypt-compat')
makedepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=('!emptydirs' '!strip')
install=
changelog=
source=("https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64-linux-redhat.rpm")
noextract=()
sha512sums=('6cdc564b177191edcf200a4849826cf07d24e70b49e916a63d4a891931bb41fa04d0b835d961329bb2746ec1bb8d69f2b7877be22a1652bccaf36463b7b34777')

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
