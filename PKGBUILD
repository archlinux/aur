# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map
pkgver=2.0.0
pkgrel=2
pkgdesc='Live visualization of all the pokemon in your area... and more! (stable releases)'
arch=('any')
url='https://jz6.github.io/PoGoMap/'
license=('GNU GPLv3+')
depends=( 'python2' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("https://github.com/AHAAAAAAA/PokemonGo-Map/archive/v${pkgver}.tar.gz")
md5sums=('727944f36be1bbae765ea8e6b866a785')

package() {
  cd "${srcdir}/PokemonGo-Map-${pkgver}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a * "${pkgdir}/opt/${pkgname}"
}
