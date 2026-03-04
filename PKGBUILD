# Maintainer: https://github.com/Geralt-Of-Rivia-Witcher/

pkgname=tbreakout-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Retro terminal Breakout game written in Go using tcell"
arch=('x86_64')
url="https://github.com/Geralt-Of-Rivia-Witcher/tbreakout"
license=('MIT')
depends=('glibc')
options=('!debug')

source=(
  "tbreakout::https://github.com/Geralt-Of-Rivia-Witcher/tbreakout/releases/download/v${pkgver}/tbreakout-linux-amd64"
)

sha256sums=(
  "a5c2fba4d2e64c90eba1b35912cd078454a051ef8092a751029c4499104c08c2"
)

package() {
  install -Dm755 tbreakout "$pkgdir/usr/bin/tbreakout"
}
