# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=1.1.1
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
sha256sums=(3de92cfb0103cef3d8042eb48f09c944b25e91ad218358aec56013de2b51dcf8)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
