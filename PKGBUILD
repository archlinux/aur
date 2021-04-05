# Maintainer: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.3
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('5c3242c183e61adbf3af7441071123bb87c78ffb106c31707127f5c8cb71c38b')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname-v$pkgver-$arch-linux/{urbit,urbit-king,urbit-worker} "$pkgdir/usr/bin"
}
