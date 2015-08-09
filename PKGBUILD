# Maintainer: avanzzzi (avanzzzi at gmail dot com)
pkgname=fortune-mod-starwars
pkgver=0
pkgrel=1
pkgdesc="Fortune cookies: Collection of quotes from the Star Wars movies"
arch=('any')
license=('unknown')
depends=(fortune-mod)
url="http://www.splitbrain.org/projects/fortunes/starwars"
source=(http://www.splitbrain.org/_media/projects/fortunes/fortune-starwars.tgz)
md5sums=('2f4443470a5d7bcb7c5efde501f8e6f5')

package(){
  cd "$srcdir/fortune-starwars"

  install -d "$pkgdir/usr/share/fortune"
  install -m644 starwars* "$pkgdir/usr/share/fortune"
}
