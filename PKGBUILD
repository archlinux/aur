# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=audiotag-thumbnailer
pkgver=0.1.1
pkgrel=1
pkgdesc="A nautilus thumbnailer for MP3 and OGG files."
arch=('any')
url="https://aur.archlinux.org/packages/audiotag-thumbnailer"
license=("custom:WTFPL")
depends=(
  'python2'
  'python2-pillow'
)
source=(
  "${pkgname}"
  "${pkgname}.schemas"
  'COPYING'
)
sha256sums=(
  'f3dedebd1a6e2c784b6585f7d6fe5430102e5347cdc99df227253db9cad4f0fb'
  '978074b71b4a2ea9ad17890b23ef27733e2567414d6e87defdd562c1a36affbc'
  'e6d7fd05263cbec72b7e73baa86ca76b27fc419767f64f74762bcb8fba05f037'
)

package () {
  cd "$srcdir"
  
  install -Dvm644 audiotag-thumbnailer.schemas "${pkgdir}/usr/share/gconf/schemas/audiotag-thumbnailer.schemas"
  install -Dvm755 audiotag-thumbnailer "${pkgdir}/usr/bin/audiotag-thumbnailer"
  
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
