# Maintainer: https://github.com/Geralt-Of-Rivia-Witcher/

pkgname=tbreakout-bin
pkgver=0.1.82
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

sha256sums=(3ce5249453c128625b25e871434c2499e4d971fe731f6482c431a9705249a1b9)

package() {
  install -Dm755 tbreakout "$pkgdir/usr/bin/tbreakout"
}
