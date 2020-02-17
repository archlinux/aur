# Maintainer: Jose Augusto <joseaugusto.881 at outlook dot com>

pkgname=xfetch
pkgver=2.0.0
pkgrel=1
pkgdesc="Yet another fetch written in ruby"
arch=('any')
url="https://github.com/JAugusto42/xfetch"
license=('MIT')

source=(
  "$pkgname-$pkgver.tar.gz"::https://github.com/JAugusto42/xfetch/archive/$pkgver.tar.gz
)

md5sums=('e25e4b9de90b727e9802f791a59f292b')
depends=('ruby')
makedepends=('git')
package() {
  cd "${pkgname}-${pkgver}"
	install -Dm755 xfetch ${pkgdir}/usr/bin/xfetch
}

