# Maintainer: Jingu <xiuluo dot android at gmail dot com>
# Contributor: Daniel Souza <aur at posix dot dev dot br>
_pkgauthor="chainner-org"
_pkgname="chainner"
pkgname="${_pkgname}-bin"
pkgver=0.18.9
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
conflicts=('chainner-rpm')
backup=()
options=('!emptydirs' '!strip')
install=
changelog=
source=("https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64-linux-redhat.rpm")
noextract=()
sha512sums=('9c93d5c2e651bbbb697d2d7bbfc806fde6ad9783d526994e0a596be3d2ede34522652cb2788f2c1b9030063ee9fea2bc4607d0890bdd8a96766cc77e71744270')

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
