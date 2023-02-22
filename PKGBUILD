# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yana-bin
_pkgname=yana
pkgver=1.0.13
pkgrel=1
epoch=
pkgdesc="Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more"
arch=("x86_64")
url="https://yana.js.org/"
_githuburl="https://github.com/lukasbach/yana"
license=(MIT)
depends=(gtk3 nss alsa-lib at-spi2-core)
options=()
optdepends=()
provides=(yana)
conflicts=(yana-appimage)
install=
source=("yana-${pkgver}_amd64.deb::${_githuburl}/releases/download/v${pkgver}/yana_${pkgver}_amd64.deb")
sha256sums=('d77ae4ea99b418b0e063f2e3ed0801144478ca5aadfe84732e4003390fca6ebf')
     
package() {
    bsdtar -xvf data.tar.xz -C ${pkgdir}
}
