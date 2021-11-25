# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.8
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('d3c498ea6e47ece9abf8c2b80a83987f9785ec3f84eb5425ea16e88a5d0a56a0')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname-v$pkgver-$arch-linux/{urbit,urbit-king,urbit-worker} "$pkgdir/usr/bin"
}
