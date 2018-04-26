# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=eul
pkgver=0.34
pkgrel=2
pkgdesc="Fast native desktop client for all major messaging services"
arch=('x86_64')
url="https://eul.im/"
license=('unknown')
depends=(
  'libcurl-compat'
  'webkit2gtk'
)
options=('!strip')
source=("https://github.com/eul-im/eul/releases/download/v${pkgver}/eul_linux.zip" 'eul')
sha256sums=('bd8f908bc39dfce67f2aa3ff3c2e5fe1e45c105ff589558dcccf0c56efee4bf7'
            'SKIP')

package() {
  install -Dm755 eul_linux "${pkgdir}"/usr/lib/eul/eul
  install -Dm755 eul "${pkgdir}"/usr/bin/eul
}
