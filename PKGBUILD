# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.15
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums_x86_64=('6da50c74d95f56336c2ea418ea07d90e0b0a6f21240301da218160c4c694da61')
source_aarch64=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-aarch64-linux)
sha256sums_aarch64=('204b4b07695f38030addbe6dd6c5996dd198af7413f12e061565ce105f03a1c3')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/urbit"
}
