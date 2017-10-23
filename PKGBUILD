# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
pkgver=0.1
pkgrel=1
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://diazchris.deviantart.com/art/Boston-Icons-558741523"
license=('CCPL:by-nc-sa')
source=("https://orig00.deviantart.net/6c41/f/2016/322/0/3/boston_icons_by_diazchris-d98nrpv.zip")
sha256sums=('fc12901bfe472bc7041ef04b89c515255a2c0ad239eb9253989155bf79572948')
options=(!emptydirs)

package() {
  install -d -m755 $pkgdir/usr/share/icons

  cd $srcdir
  mv Boston $pkgdir/usr/share/icons/
}
