# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.5.1
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
md5sums=('7115dc49f46367f85f56f82409ab60e9')
sha512sums=('80bf2a46f67940999db4e89171cda3f1b22c86cacccd7ee2e0e38a961f89083a76505b1288f65f8fc9fd6a91d3b98748f047a2d27e1763ba2aa7eef1fb7e24ae')
validpgpkeys=()

package() {
  tar xf data.tar.xz

  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/
  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
