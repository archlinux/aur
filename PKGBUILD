# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=jsgtk
pkgrel=1
pkgver=0.12.1
pkgdesc="A simplified approach to GJS for Node.JS and JavaScript developers."
arch=('any')
url="https://github.com/WebReflection/jsgtk"
license=('MIT')
depends=('gjs')
source=(https://webreflection.github.io/jsgtk/archive/$pkgname-$pkgver.tar.gz)
md5sums=('12a1a0b53fa2c19e3831272ed2a34d17')

package() {

  cd "${srcdir}/${pkgname}"

  # Install program files
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r jsgtk_modules "${pkgdir}/usr/lib/${pkgname}"

  # Install a launcher
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

}
