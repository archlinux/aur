# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="The markdown-based note-taking app that doesn't suck"
arch=('x86_64')
url="https://github.com/fabiospampinato/notable"
license=('MIT')
groups=()
depends=('libxss')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fabiospampinato/notable/releases/download/v${pkgver}/notable_${pkgver}_amd64.deb")
noextract=()
md5sums=('849e756bfcfba43f3b0e0d8d30d0f237')
sha512sums=('92c286401fa10c120eeaf19c6c327b0bb5f351637a4abf089ce56420f7fa971d077c2be6c303435d6bf7e2cda15b02700975f67368e3d4fecae48ebe00dd090a')
validpgpkeys=()

package() {
  tar xf data.tar.xz
  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/
  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
