# Maintainer: Juan Tascon
# Maintainer: Aaron France <aaron.l.france@gmail.com

pkgname=kerl
pkgver=1.8.5
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=(i686 x86_64)
license=('MIT')
provides=("kerl")
source=("https://github.com/kerl/kerl/archive/${pkgver}.tar.gz")
md5sums=('bf23984d0acd81bfbc62fb208bc82858')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 kerl "$pkgdir/usr/bin/kerl"
}
