# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=punch-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Holepunch CLI Tool"
arch=('x86_64')
url='https://holepunch.io'
license=('GPL3')
provides=('punch')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://github.com/CypherpunkArmory/punch/releases/download/${pkgver}/punch-linux-amd64.zip")
sha256sums=('7b2c10154692a95ee72fc7f9a9487efc934d519afad7a0f9c57b4d3105d5e26f')

package() {
  install -Dm755 punch -t "${pkgdir}/usr/bin"
}