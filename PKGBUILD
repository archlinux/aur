# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=disfetch
pkgver=2.10
pkgrel=1
pkgdesc='Yet another *nix distro fetching program, but less complex.'
arch=('any')
url="https://github.com/llathasa-veleth/$pkgname"
license=('MIT')
depends=('bash>=4.0.0')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('387696feda5d90da0c48bc91f365a7dd92ef9e4726465259ae464c92f3dd9c20')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
