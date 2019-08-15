# Maintainer: PommeDroid <pommedroid@dreamnet.tech>

pkgname=dreampower-checkpoints
pkgver=0.0.1
pkgrel=1
pkgdesc='Checkpoints for dreampower CLI application'
arch=('x86_64')
options=(!strip)
url='https://github.com/private-dreamnet/dreampower-checkpoints'
license=('GPL3')
makedepends=()
source=(
  "checkpoints::https://cdn.dreamnet.tech/releases/checkpoints/v$pkgver.zip"
)
md5sums=(
  '0b89647a2ef60f765e67a6d32f34786b'
)

package() {
  local name="dreampower"
  install -dm755 "$pkgdir/opt/$name/"
  cp -R checkpoints "$pkgdir/opt/$name/"
  chmod -R 755 "$pkgdir/opt/$name/" 
}
