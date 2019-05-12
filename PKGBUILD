# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.5.0
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
md5sums=('d93b98c4a6bdf65908b94af73868adea')
sha512sums=('4db967fc1a38729bc26378f5cd7e6d8a27fb3cd08b714b014ea4c6d573e32bf10c613b31abb2cee56cce204c6a15284f971728a4f8aebf6f5bde18ef817274b1')
validpgpkeys=()

package() {
  tar xf data.tar.xz
  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/
  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
