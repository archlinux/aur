# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.3.0
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
md5sums=('39b486528311e6acc0fb95aad0308637')
sha512sums=('0dd8cf07ac467ce08cebc5ffccea472f37533215382c53d54cdce8d373a61685677ea7a6c29c02bb626533320c835da5a2cddbf4a266b03b03bb047f96b5e78b')
validpgpkeys=()

package() {
  tar xf data.tar.xz
  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/
  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
