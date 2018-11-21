# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=shipcat
pkgver=0.74.0
pkgrel=1
pkgdesc="A standardisation tool on top of kubernetes to config manage microservices"
arch=('x86_64')
url="https://github.com/Babylonpartners/$pkgname/"
license=('Apache')
source=("https://github.com/Babylonpartners/$pkgname/releases/download/$pkgver/$pkgname.x86_64-unknown-linux-musl.tar.gz")
sha256sums=('91e8a3cf6ee2f16249745a0d30f1ae03f161ff7a61d0ded65beb0a04a4c3c110')

package() {
  install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/share/$pkgname/$pkgname.complete.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# vim:set ts=2 sw=2 et:
