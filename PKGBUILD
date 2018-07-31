# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.4.3
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('bcf1c3a03bc152417114dd4399fce54a9d3e2ce9a3875f37c4f4efbb40904243')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
