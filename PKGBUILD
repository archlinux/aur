# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=1.2.1
pkgrel=1
pkgdesc='A pacman wrapper which helps you watch important package updates'
arch=('any')
url="https://github.com/ouuan/$pkgname"
license=('Apache-2.0')
depends=(
  'python-yaml'
  'python-appdirs'
  'python-termcolor'
)
source=("$pkgname-$pkgver.py::https://github.com/ouuan/$pkgname/raw/$pkgver/$pkgname.py")
sha256sums=(7b00a4fa83d6124dedbbe4a8414d71b584771708474aae90ec5cc91ebbd178e8)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
