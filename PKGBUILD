# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=3.0
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-x86_64)
sha256sums_x86_64=('09081f1521e75fce5d30b91400ca490ecf2c0c014dd1568d37d94b1626642f38')

source_aarch64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-aarch64)
sha256sums_aarch64=('fc65e13c9205f2cde339e4942f825b99e1bf91c03579ec18d0e1e65e2bf75688')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/urbit"
}
