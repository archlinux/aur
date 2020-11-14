# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.3.1
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
source=("$pkgver-pacwatch.py::https://github.com/ouuan/pacwatch/raw/$pkgver/pacwatch.py")
sha256sums=(447da87fd72b06151e6e630bd0bc543798680302e6a78b69c32cdaa33bb8f33e)

package() {
    install -Dm755 "$pkgver-pacwatch.py" "$pkgdir/usr/bin/$pkgname"
}
