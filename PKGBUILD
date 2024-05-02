# Maintainer: Joar Heimonen <joarheimonen@live.no>
# Note: This is only an install script for Yuma123, not the actual project itself.

pkgname=simple-notes
pkgver=2.0.6
pkgrel=1
pkgdesc="A simple and open source notes application"
arch=('x86_64')
url="https://github.com/danielmbomfim/notes-app-desktop"
license=('MIT')
depends=('curl' 'libuv' 'zlib')
provides=("simple-notes")
conflicts=("simple-notes" "simple-notes-git")

source=("${url}/releases/download/app-v${pkgver}/anotacoes_${pkgver}_amd64.deb")
sha256sums=('bffd37e6d3e22508906b7c1c36628c517bbc0fd7880e4463f9b40820501c17d6')

package() {
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
