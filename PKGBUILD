# Maintainer: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=1.3.4
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
arch=(i686 x86_64)
license=('MIT')
provides=("kerl")
source=("https://github.com/kerl/kerl/archive/${pkgver}.tar.gz")
md5sums=('f543c8fa777b34f31e7f190bb57ebd94')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
}
