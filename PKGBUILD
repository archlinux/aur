# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=2.3
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-x86_64)
sha256sums_x86_64=('128d5f2dba6d4537e8e4821ac56e0d6e9dfd44df3525d7e3ffc729ab9f422aa1')

source_aarch64=(https://bootstrap.urbit.org/vere/live/v$pkgver/vere-v$pkgver-linux-aarch64)
sha256sums_aarch64=('bcf5cb4058da9ef998ca654b612def5e981430516e1ffbc5f6d9d2dfc9e800ba')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/urbit"
}
