# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=1.2.2
pkgrel=1
pkgdesc='A pacman wrapper which helps you watch important package updates'
arch=('any')
url="https://github.com/ouuan/$pkgname"
license=('Apache-2.0')
depends=(
  'python-yaml'
  'python-platformdirs'
  'python-termcolor'
)
source=("$pkgname-$pkgver.py::https://github.com/ouuan/$pkgname/raw/$pkgver/$pkgname.py")
sha256sums=(32f91d88bc7fc12044069b7e994bc4e4eeadcbf7383fd037715b65b79c252308)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
