# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.3.18
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('d46112fdb48d4cb85fa127f06627d31a0397257ae51d44ae427edf5fa1544a6d')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
