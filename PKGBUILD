# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="The markdown-based note-taking app that doesn't suck"
arch=('x86_64')
url="https://github.com/fabiospampinato/notable"
license=('MIT')
groups=()
depends=()
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
md5sums=('ea37b21f68b2379f2360877ab5ba67c2')
sha512sums=('547480579ffb2c119f7305a3ae055098166035ad0f51cfa03d5a9c2c0c5352343dd902083c711bf3161e6abe96d153f95641c1ca4dcafea41a9508914b4d2000')
validpgpkeys=()

package() {
  tar xf data.tar.xz
  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/
  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
