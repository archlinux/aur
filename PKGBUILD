# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.4.4
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('48842af6ea6440dc06ec4a88a4ece5a7ee1583335ac5157d273a562fed740a91')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
