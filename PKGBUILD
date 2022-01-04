# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=disfetch
pkgver=3.1
pkgrel=1
pkgdesc='Yet another *nix distro fetching program, but less complex.'
arch=('any')
url="https://github.com/llathasa-veleth/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ac6a8bcd902b5222571f2f143cfbf0c7fbd21e3df25904b727191afcd7d1c1a4')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
