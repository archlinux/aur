# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.2
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('abf73566281630b9f616c8fea13b228fdc392dfc8a6c5397727f660a0bd25412')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname-v$pkgver-$arch-linux/{urbit,urbit-king,urbit-worker} "$pkgdir/usr/bin"
}
