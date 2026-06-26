# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=2602
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
sha256sums=('2878c85f5f43a4a4e0952b1fd4e5fe097c1c143997a8047c7e1e788892aa9357')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
