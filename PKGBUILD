# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=2.7
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-x86_64)
sha256sums_x86_64=('4f98ea6a0d495083a3a1a0a7808dc5906b680a606ce2d75572acc1570d614b3c')

source_aarch64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-aarch64)
sha256sums_aarch64=('c5613b72cde6bd82144de20e12c7f42c50624b8655842dbb96d327f5010f4269')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/urbit"
}
