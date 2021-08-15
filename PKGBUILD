# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=disfetch
pkgver=2.11
pkgrel=1
pkgdesc='Yet another *nix distro fetching program, but less complex.'
arch=('any')
url="https://github.com/llathasa-veleth/$pkgname"
license=('MIT')
depends=('bash>=4.0.0')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d983e9220bce041bae0c2884b4fe9f91817a167bdebad26d809965ac51dde209')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
