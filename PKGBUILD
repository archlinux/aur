# Maintainer: James An <james@jamesan.ca>
pkgname=geany-openscad
pkgver=20140503
pkgrel=1
pkgdesc="Syntax highlighting and auto-completion for OpenSCAD files in Geany."
arch=('any')
url='http://www.thingiverse.com/thing:263620'
license=('CCPL:by-sa')
depends=('geany')
install="$pkgname.install"
source=('http://www.thingiverse.com/download:479705')
sha256sums=('ceb2eb9dd54a879b93e6ba7645aecd668ff183d0705d07a9b863fdfa4560dac6')

package() {
  install -Dm644 'download:479705' "$pkgdir/usr/share/geany/filedefs/filetypes.OpenSCAD.conf"
}
