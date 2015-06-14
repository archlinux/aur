# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=gimp-plugin-instagram-effects
pkgver=0.1
pkgrel=1
pkgdesc="Collections of plug-ins who can recreate (as closely as possible) Instagram's effects"
arch=('any')
url='http://registry.gimp.org/node/28613'
license=('GPL')
depends=(gimp python)
source=("http://registry.gimp.org/files/gimp_instagram_effects.zip")
sha256sums=('a4c49cb1baa858171a29e25cbd8bb09f95848483859d1ebfba52991e69a651df')

package(){
  cd "$srcdir"
  _plugins='/usr/lib/gimp/2.0/plug-ins/'
  install -dm755 "$pkgdir"/$_plugins
  for i in *.py; do
    install -Dm755 $i "$pkgdir"/$_plugins
  done
}
