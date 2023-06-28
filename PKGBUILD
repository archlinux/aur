# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=2.10
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-x86_64)
sha256sums_x86_64=('5c5df89fe2e0e965b7e077f870cc9ebf29c990dccb3ec4dfbf6d42bbd4452e30')

source_aarch64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-aarch64)
sha256sums_aarch64=('8ae15a146aef1dca35641e18e95298b83aa68c22e2deafc43b7739f9fbd537b8')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/urbit"
}
