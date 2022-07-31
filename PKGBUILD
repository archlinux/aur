# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.10
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname::https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums=('dd226cb6b3ac7f376c4bc31f5f72707fe743175b2597c2eb7ed68d4d7c331871')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname "$pkgdir/usr/bin"
}
