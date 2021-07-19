# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rustbuster-bin
pkgver=3.0.3
pkgrel=2
pkgdesc='A comprehensive web fuzzer and content discovery tool'
arch=('x86_64')
url="https://github.com/phra/rustbuster"
license=('GPL3')
depends=('gcc-libs' 'openssl')
provides=('rustbuster')
conflicts=('rustbuster')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/rustbuster-v$pkgver-x86_64-unknown-linux-gnu")
sha256sums=('3f790029bfe4350bd994153465c81beedc54d61c1dadeda124108bf875459574')
validpgpkeys=('91FF93D1B85D76B5')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/rustbuster"
}

# vim:set ts=2 sw=2 et:
