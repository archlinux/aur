# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=2601
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
sha256sums=('b860f17f9df3c0524dd2ef2c639ab5e43ad0006b77b8f7bb6d191bf528536885')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
