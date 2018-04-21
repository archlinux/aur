# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=eul
pkgver=0.33
pkgrel=1
pkgdesc="Fast native desktop client for all major messaging services"
arch=('x86_64')
url="https://eul.im/"
license=('unknown')
depends=('libcurl-compat')
options=('!strip')
source=("https://github.com/eul-im/eul/releases/download/v${pkgver}/eul_linux.zip" 'eul')
sha256sums=('a70aa17a803c4fde019ecf33c4cec58e5cb008f2e376a131a952a8d86e86c88e'
            'SKIP')

package() {
  install -Dm755 eul_linux "${pkgdir}"/usr/lib/eul/eul
  install -Dm755 eul "${pkgdir}"/usr/bin/eul
}
