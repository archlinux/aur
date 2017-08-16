# Maintainer: Kamalavelan aka demonshreder <sskamalavelan@gmail.com>

pkgname=monocypher
_pkgname=monocypher
pkgver=1.0.1
pkgrel=3
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="http://loup-vaillant.fr/projects/monocypher/"
license=('custom:BSD')
depends=('glibc')
source=("http://loup-vaillant.fr/projects/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha512sums=('9e5542a3e853a1e786dbf67c020fecb9c066ed272175a57b12fb8b80b0faef2441c4c11c506a00215f13477ee0b96614597dc80a8c38f29bc53313610d0f8cec')

package() {
  cd "$_pkgname-$pkgver"
  install -d -m 755 "$pkgdir/usr/include/$pkgname"
  install -m 644 src/monocypher.c "$pkgdir/usr/include/$pkgname/monocypher.c"
  install -m 644 src/monocypher.h "$pkgdir/usr/include/$pkgname/monocypher.h"
  install -m 644 src/sha512.h "$pkgdir/usr/include/$pkgname/sha512.h"
  install -m 644 src/sha512.c "$pkgdir/usr/include/$pkgname/sha512.c"
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
}
