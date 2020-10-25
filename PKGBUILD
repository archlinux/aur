# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=docker-credential-lastpass
pkgver=1.0
pkgrel=1
pkgdesc="Docker helper to store credentials in LastPass"
arch=(any)
url="https://gitlab.com/1ace/docker-credential-lastpass"
license=('MIT')
depends=('lastpass-cli')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a39e306ac29007f976e46d3a32b6415f08a1959b87a9726fa0c587047eb44bd2')
install=$pkgname.install

package() {
  install -D -m 0755 "$pkgname-v$pkgver"/docker-credential-lastpass "$pkgdir/usr/bin/docker-credential-lastpass"
}
