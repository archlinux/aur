# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=jsgtk
pkgrel=1
pkgver=0.9.0
pkgdesc="A simplified approach to GJS for Node.JS and JavaScript developers."
arch=('any')
url="https://github.com/WebReflection/jsgtk"
license=('MIT')
depends=('gjs')
source=(https://github.com/WebReflection/jsgtk/blob/master/archive/$pkgname-$pkgver.tar.gz?raw=true)
md5sums=('ecbeaad765a3817589ba392442a8adf1')

package() {

  cd "${srcdir}/${pkgname}"

  # Install program files
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r jsgtk_modules "${pkgdir}/usr/lib/${pkgname}"

  # Install a launcher
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

}
