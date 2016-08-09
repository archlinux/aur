# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map
pkgver=2.2.0
pkgrel=1
pkgdesc='Live visualization of all the pokemon in your area... and more! (stable releases)'
arch=('any')
url='https://pokemongomap.github.io/PoGoMapWebsite/'
license=('GNU GPLv3+')
depends=( 'python2' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("https://github.com/PokemonGoMap/PokemonGo-Map/archive/V${pkgver}.tar.gz")
md5sums=('3f45144ec3bc7b2245f0923387759d4d')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/PokemonGo-Map-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
