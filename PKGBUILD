# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.13
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums=('1601aba78636807231279f673ddf48dc2f98977aa4ccff0994f04c33898485d7')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-x86_64-linux" "$pkgdir/usr/bin/urbit"
}
