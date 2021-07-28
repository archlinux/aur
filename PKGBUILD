# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=1.1.0
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
sha256sums=(5ec26dbda6fcade749a5b51aae07bdc63f1350c8fa0802b5f4036299196cc8a1)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
