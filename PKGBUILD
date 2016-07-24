# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map
pkgver=2.0
pkgrel=1
pkgdesc='Live visualization of all the pokemon in your area... and more! (stable releases)'
arch=('any')
url='https://jz6.github.io/PoGoMap/'
license=('GNU GPLv3+')
depends=( 'python2' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("https://github.com/AHAAAAAAA/PokemonGo-Map/archive/${pkgver}.tar.gz")
md5sums=('455910bc163889f0f96224afd31aa630')

package() {
  cd "${srcdir}/PokemonGo-Map-${pkgver}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a * "${pkgdir}/opt/${pkgname}"
}
