# Maintainer: https://github.com/Geralt-Of-Rivia-Witcher/

pkgname=tbreakout-bin
pkgver=0.1.91
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

sha256sums=(2cd0dc15c60affa60e68354eea49aeb05444ca342f1e254b55ce4509a42da916)

package() {
  install -Dm755 tbreakout "$pkgdir/usr/bin/tbreakout"
}
