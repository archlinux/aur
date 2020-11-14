# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.4.2
pkgrel=1
pkgdesc='A pacman wrapper which helps you watch important package updates'
arch=('any')
url="https://github.com/ouuan/$pkgname"
license=('Apache')
depends=(
  'python-yaml'
  'python-appdirs'
  'python-termcolor'
)
source=("$pkgname-$pkgver.py::https://github.com/ouuan/$pkgname/raw/$pkgver/$pkgname.py")
sha256sums=(c66fa71325b5fd8407e11cfde9bf6a8f8f6cda692df5980c3bfba122f7ffb2cd)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
