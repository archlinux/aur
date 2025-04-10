# Maintainer: Xyem <xyem@electricjungle.org>
# Contributor: James An <james@jamesan.ca>
pkgname=geany-openscad
pkgver=20250410
pkgrel=1
pkgdesc="Syntax highlighting and auto-completion for OpenSCAD files in Geany."
arch=('any')
url='http://www.thingiverse.com/thing:263620'
license=('CCPL:by-sa')
depends=('geany')
install="$pkgname.install"
source=('filetypes.OpenSCAD.conf')
sha256sums=('ceb2eb9dd54a879b93e6ba7645aecd668ff183d0705d07a9b863fdfa4560dac6')

package() {
  install -Dm644 'filetypes.OpenSCAD.conf' "$pkgdir/usr/share/geany/filedefs/filetypes.OpenSCAD.conf"
}
