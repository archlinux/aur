# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=1.2.0
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
sha256sums=(f498c52601bcc347fd59d245f82fe429900e9633cc24e5a2d3be2005e0394050)

package() {
    install -Dm755 "$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
