# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.4.1
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
sha256sums=(ab079bdf81908efed20fe3a085b5068f97f71dfc7d8496d1ea7fa7f7dc280823)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
