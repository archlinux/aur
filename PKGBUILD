# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.12
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums=('7d67130c588a90f63b35fae00f3de2dcd8d30b7aa9a369fc03502032084935f3')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-x86_64-linux" "$pkgdir/usr/bin/urbit"
}
