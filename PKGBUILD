# Maintainer: Siddhant Kumar Singh

pkgname=tbreakout-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Retro terminal Breakout game written in Go using tcell"
arch=('x86_64')
url="https://github.com/Geralt-Of-Rivia-Witcher/tbreakout"
license=('MIT')
depends=('glibc')

source=(
  "tbreakout::https://github.com/Geralt-Of-Rivia-Witcher/tbreakout/releases/download/v${pkgver}/tbreakout-linux-amd64"
)

sha256sums=(
  "af79c3d9ce771bf5a7c541d904dfec170f0892b534ff3a9cc433f63908f6bca6"
)

package() {
  install -Dm755 tbreakout "$pkgdir/usr/bin/tbreakout"
}
