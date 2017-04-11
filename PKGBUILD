# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.3.27
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('9a8894571cdd8a4a42a16c6bd932678563925b066322f83035e5652c0aa9f4dc')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
