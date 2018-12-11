# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Contributor: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=herokuish
pkgver=0.4.5
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('87ace79ab774d1a0ac55547961b1d3caecaee79ba80f42c1cc095c02d8d437d6')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
