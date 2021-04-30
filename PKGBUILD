# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.5
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname-$pkgver.tgz::https://bootstrap.urbit.org/$pkgname-v$pkgver-linux64.tgz)
sha256sums=('24c6dd4bd8305c07750f64a730e1e3d58a3e62c306f1cfde39aaeacb17aaf4b9')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname-v$pkgver-$arch-linux/{urbit,urbit-king,urbit-worker} "$pkgdir/usr/bin"
}
