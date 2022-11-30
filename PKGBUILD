# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.13
pkgrel=2
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums_x86_64=('1601aba78636807231279f673ddf48dc2f98977aa4ccff0994f04c33898485d7')
source_aarch64=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-aarch64-linux)
sha256sums_aarch64=('2e1c8f96064762ffdc5b777664e1b8fd11291d0a6d5c18089f3a5da18d70be0d')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/urbit"
}
