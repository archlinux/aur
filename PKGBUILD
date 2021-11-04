# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.7
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('b43010e71f7fe3a1e2126ba234aca61ed9d4313aeb61c59f3ce8fe46b02c13de')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname-v$pkgver-$arch-linux/{urbit,urbit-king,urbit-worker} "$pkgdir/usr/bin"
}
