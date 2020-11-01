# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=docker-credential-lastpass
pkgver=1.1
pkgrel=1
pkgdesc="Docker helper to store credentials in LastPass"
arch=(any)
url="https://gitlab.com/1ace/docker-credential-lastpass"
license=('MIT')
depends=('lastpass-cli')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('1095da47e5379b80a2a9785c15bb5c252378f5a9fe882bdc5610b08e50db11c2')
install=$pkgname.install

package() {
  install -D -m 0755 "$pkgname-v$pkgver"/docker-credential-lastpass "$pkgdir/usr/bin/docker-credential-lastpass"
  install -D -m 0755 "$pkgname-v$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
