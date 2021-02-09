# Maintainer: Filipe Cruz <filipecruz@tuta.io>
pkgname=playlist-maker-rs-bin
_pkgname=playlist-maker
_binname=pl-mker
pkgver=0.1.1
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust: binary version'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('cargo')
conflicts=(playlist-maker-rs)
source=("$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f395d2da3bba58c47730c2ea066c4a12e04d983db8a08e7758e3978299efd6cd')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_binname"
}
