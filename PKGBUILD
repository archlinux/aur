# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.3.11
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('9598db98505a9dc853b05acbbb5d88a0b22b9f9138b544b64eaa3f2551bc3637')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
