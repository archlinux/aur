# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=2604
pkgrel=1
epoch=
pkgdesc="The LZMA SDK provides the documentation, samples, header files, libraries, and tools you need to develop applications that use LZMA compression."
arch=('any')
url="https://www.7-zip.org/sdk.html"
license=('public domain')
groups=()
depends=('p7zip')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("https://www.7-zip.org/a/lzma${pkgver}.7z")
noextract=("lzma2102.7z")
sha256sums=('bd98058d0e12c5da970dd4e5e1d8fa24f2d704914d96e69c28f92ed45421a439')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
