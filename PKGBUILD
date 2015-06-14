# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gimp-script-luminosity-masks
pkgver=2
pkgrel=1
pkgdesc='Generate a full set of Light, Dark, and Midtone masks as channels for your image'
arch=('any')
url='http://registry.gimp.org/node/28644'
license=('CCPL:cc-by-sa')
depends=(gimp)
options=(!strip)
source=("http://registry.gimp.org/files/patdavid-luminosity-masks-2.scm")

package(){
  cd "$srcdir"
  install -Dm644 patdavid-luminosity-masks-2.scm \
    "$pkgdir"/usr/share/gimp/2.0/scripts/patdavid-luminosity-masks-2.scm
}
md5sums=('85549a490e552db4c6f95642399bab90')
