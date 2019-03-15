# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="The markdown-based note-taking app that doesn't suck"
arch=('x86_64')
url="https://github.com/fabiospampinato/notable"
license=('AGPL')
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
md5sums=('f35891a17d2ceafb6da2b92a023f2c82')
sha512sums=('24119ab7f96a3a7173b4094593f910cb3f91fbdc48151c2739a98b2a2ccff7afb6fe4b9bff3600a7bcce9497314188c1fb66fc51542359ba643f54ef7c01bc59')
validpgpkeys=()

package() {
  tar xf data.tar.xz
  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/
  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
