# Maintainer: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=1.4.2
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=(i686 x86_64)
license=('MIT')
provides=("kerl")
source=("https://github.com/kerl/kerl/archive/${pkgver}.tar.gz")
md5sums=('0f1cffcf0bb97d1a635afc0aa05a887b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
}
