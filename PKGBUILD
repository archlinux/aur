# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=1.1.2
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
sha256sums=(ace7e07d4f1b1cf1cb05fd19220c9950bb5a2a0c02a43f8c3823d73102eb4956)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
