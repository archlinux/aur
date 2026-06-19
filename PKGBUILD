# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=4.5
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-x86_64)
sha256sums_x86_64=('e26aea39fe1b3645c572ae45f79265c126b19f3efed2e1712f63d0c62f94a00d')

source_aarch64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-aarch64)
sha256sums_aarch64=('2e92241aa05e6d4ac1c6be0553fa8497f241405476e2f8aaf39a8a32d5235391')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/urbit"
}
