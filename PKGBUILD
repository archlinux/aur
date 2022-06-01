# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.9
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source=($pkgname::https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums=('852c3a550b04315f79ac50f354659a14084f6750e59e81b884d438435561941a')

package() {
  msg2 'Installing...'
  install -d "${pkgdir}/usr/bin"
  install ${srcdir}/$pkgname "$pkgdir/usr/bin"
}
