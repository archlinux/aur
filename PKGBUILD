# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.2.4
pkgrel=1
pkgdesc='A pacman wrapper which helps you watch important package updates'
arch=('any')
url="https://github.com/ouuan/pacwatch"
license=('Apache')
depends=(
  'python-yaml'
  'python-appdirs'
  'python-termcolor'
)
source=("https://github.com/ouuan/pacwatch/raw/$pkgver/pacwatch.py")
sha256sums=(0b53fc6a28da43aa28991b3b85456a7d300a30860ebe198d0c73b0047a88042b)

package() {
    install -Dm755 pacwatch.py "$pkgdir"/usr/bin/$pkgname
}
