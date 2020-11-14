# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.3.0
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
sha256sums=(42e2535340b4845be9f2e2d47671befaf4b5b573b51dd827e5cc0424eef6ac22)

package() {
    install -Dm755 pacwatch.py "$pkgdir"/usr/bin/$pkgname
}
