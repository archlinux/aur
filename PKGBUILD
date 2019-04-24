# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.5.0
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('bsd')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz")
sha256sums=('e5c3127dbb09d61f575b7b1b9052a08c4c5e1fd99b3ef67cb45438215c5a3bb4')

package() {
  install -Dm 755 herokuish "${pkgdir}/usr/bin/herokuish"
}
