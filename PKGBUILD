# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=gimp-script-smart-remove
pkgver=1
pkgrel=3
pkgdesc="A GIMP script that heal selection using resynth plugin."
arch=('any')
url="http://registry.gimp.org/node/15118"
license=('GPL')
depends=('gimp' 'gimp-plugin-resynthesizer')
provides=('gimp-script-heal-selection')
source=(http://registry.gimp.org/files/smart-remove.scm)
sha256sums=('ae3d225cf9040c3ab50c8845bb3b62c9a05359169ce6f6a9c6e507fb61809297')

package(){
  cd "$srcdir"
  install -Dm0644 smart-remove.scm \
    "$pkgdir"/usr/share/gimp/2.0/scripts/smart-remove.scm
}
