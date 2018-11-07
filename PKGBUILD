# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Contributor: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=herokuish
pkgver=0.4.0
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('e76d51c87a42d91ce43eba1a67f7dda4dc49843fc26d89071763d7dd984c7e0a')

package(){
  install -Dm 755 herokuish "$pkgdir"/usr/bin/herokuish
}
