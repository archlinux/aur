# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.3.9
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('fd6f596cb58df131aecc1f770650420e1bf9f09e7fe4b5cc62a2a4276654c12c')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
