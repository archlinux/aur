# Maintainer: Kamalavelan aka demonshreder <sskamalavelan@gmail.com>

pkgname=monocypher
_pkgname=monocypher
pkgver=1.1.0
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64')
url="http://loup-vaillant.fr/projects/monocypher/"
license=('custom:BSD')
depends=('glibc')
source=("https://monocypher.org/download/monocypher-${pkgver}.tar.gz")
sha512sums=('9f86c124f07785bceb0cade03db679d6630c200a4f71f972ab5a6633edeb7cec495feb76a04a0ade6c78ac0c3a0d68ee312d58442d198ae0e6a65369ad9e6745')

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
