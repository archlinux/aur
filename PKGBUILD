# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=echomd
pkgrel=1
pkgver=0.1.1
pkgdesc="A markdown like conversion tool for shell terminals."
arch=('any')
url="https://github.com/WebReflection/echomd"
license=('MIT')
depends=('perl')
source=(https://webreflection.github.io/echomd/archive/$pkgname-$pkgver.tar.gz)
md5sums=('a8380b2b5b2581ae4392ee4be59e91ef')

package() {

  cd "${srcdir}/${pkgname}"

  # Install program file
  install -Dm755 ${pkgname}.pl "${pkgdir}/usr/bin/${pkgname}"

}
