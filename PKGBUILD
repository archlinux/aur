# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=space-age-ttf
pkgver=v1.0
pkgrel=1
pkgdesc="Space Age font from MetalAdventure role play game."
arch=('any')
url="https://www.legrog.org/jeux/metal-adventures"
license=('Unknown')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('space-age.ttf')
noextract=()
sha256sums=('7acf26aa58a33090283d2e4846c43f7d85b9df342ad3df5c09fdd183d6ea6e29')

# package() {
#   mkdir -v -p "$pkgdir/share/fonts"
#   cp -v space-age.ttf "$pkgdir/share/fonts/space-age.ttf"
# }

package() {
   if [[ ! -d "$pkgdir/usr/share/fonts/TTF" ]]; then
	  mkdir -p $pkgdir/usr/share/fonts/TTF
   fi
   install -Dm644 *.ttf $pkgdir/usr/share/fonts/TTF/
}
