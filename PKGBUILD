# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=jsgtk
pkgver=0.8.2
pkgrel=1
pkgdesc="A simplified approach to GJS for Node.JS and JavaScript developers."
arch=('any')
url="https://github.com/WebReflection/jsgtk"
license=('MIT')
depends=('gjs')
source=($pkgname-$pkgver.tar.gz)
md5sums=('56f6c8d84226575fde58c28d9e4090f1')

package() {

  cd "${srcdir}/${pkgname}"

  # Install program files
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r jsgtk_modules "${pkgdir}/usr/lib/${pkgname}"

  # Install a launcher
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

}
