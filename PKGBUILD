# Maintainer: taotieren <admin@taotieren.com>

pkgname=lzma-sdk
pkgver=2409
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
sha256sums=('79b39f10b7b69eea293caa90c3e7ea07faf8f01f8ae9db1bb1b90c092375e5f3')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname}"
    7z x "${srcdir}/lzma${pkgver}.7z" -o"${pkgdir}/usr/share/${pkgname}"
}
