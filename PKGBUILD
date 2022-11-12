# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.11
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname::https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums=('8d0052fd7ff7a6137f0746c38485ad5d897df6538407bfd2af9120d89f80b882')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname "$pkgdir/usr/bin"
}
