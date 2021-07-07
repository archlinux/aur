# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=21.02
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
source=("https://www.7-zip.org/a/lzma2102.7z")
noextract=("lzma2102.7z")
sha256sums=('299c435e5b97c0419deac0afd1df1b5fa8618ecb166d1d38621b3f78bec22d75')
#validpgpkeys=()


package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma2102.7z" -o"${pkgdir}/usr/share/${pkgname}"

}
