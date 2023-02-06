# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=21.07
pkgrel=0
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
source=("https://www.7-zip.org/a/lzma${pkgver/./}.7z")
noextract=("lzma2102.7z")
sha256sums=('833888f03c6628c8a062ce5844bb8012056e7ab7ba294c7ea232e20ddadf0d75')
#validpgpkeys=()


package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver/./}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
