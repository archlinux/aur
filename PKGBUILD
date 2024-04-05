# Maintainer: Joar Heimonen <joarheimonen@live.no>
# Note: This is only an install script for Yuma123, not the actual project itself.

pkgname=simple-notes
pkgver=2.0.5
pkgrel=1
pkgdesc="A simple and open source notes application"
arch=('x86_64')
url="https://github.com/danielmbomfim/notes-app-desktop"
license=('MIT')
depends=('curl' 'libuv' 'zlib')
provides=("simple-notes")
conflicts=("simple-notes" "simple-notes-git")

source=("${url}/releases/download/app-v${pkgver}/anotacoes_${pkgver}_amd64.deb")
sha256sums=("2b4733c20424068540c766501dad0157b2a4fd2a97781d1ea4ea9cb1365a6402")

package() {
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
