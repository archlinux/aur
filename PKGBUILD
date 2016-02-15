# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.3.8
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('b01d4959e946125aa46ccf8c97a1d07c17bb00960750649b902d3d6d4c0f551a')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
