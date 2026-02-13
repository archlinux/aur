# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=2600
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
sha256sums=('6b7d0c8ed1a67112d5337e4532ecdcb9fd2eab8b1f6bb54199f9b6a627b506cc')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
