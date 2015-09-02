# Maintainer: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgrel=1
pkgver=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
arch=(i686 x86_64)
license=('MIT')
provides=("kerl")
source=('git://github.com/spawngrid/kerl.git')
makedepdends=('git')
md5sums=('SKIP')

_gitname='kerl'

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
}