# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=shipcat
pkgver=0.79.0
pkgrel=1
pkgdesc="A standardisation tool on top of kubernetes to config manage microservices"
arch=('x86_64')
url="https://github.com/Babylonpartners/$pkgname/"
license=('Apache')
source=("https://github.com/Babylonpartners/$pkgname/releases/download/$pkgver/$pkgname.x86_64-unknown-linux-musl.tar.gz")
sha256sums=('64bbe56000f9ff345f3c2f85d45fca6bcc180e7584c955b39ccf812bd0ee7117')

package() {
  install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/share/$pkgname/$pkgname.complete.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# vim:set ts=2 sw=2 et:
