# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=26.05
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
source=("https://github.com/ip7z/7zip/releases/download/${pkgver}/lzma${pkgver//./}.7z")
noextract=("lzma${pkgver//./}.7z")
sha256sums=('668fda469b7f584f246008cf28359c66ef98d65fafb3b22a52672eebe6970c28')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver//./}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
