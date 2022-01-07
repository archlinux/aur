# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=disfetch
pkgver=3.2
pkgrel=1
pkgdesc='Yet another *nix distro fetching program, but less complex.'
arch=('any')
url="https://github.com/llathasa-veleth/$pkgname"
license=('MIT')
depends=('xorg-xprop')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1d8214d93990c1fd4042a611471543040ef00bd19eb24a44a094feef8921df70')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
