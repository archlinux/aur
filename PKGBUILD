# Maintainer: James An <james@jamesan.ca>
pkgname=geany-openscad
pkgver=20140305
pkgrel=2
pkgdesc="Syntax highlighting and auto-completion for OpenSCAD files in Geany."
arch=('any')
url='http://www.thingiverse.com/thing:263620'
license=('CCPL:by-sa')
depends=('geany')
install="$pkgname.install"
source=('http://www.thingiverse.com/download:479705')
md5sums=('b97833567bdc0e084ae226ca7dc0a722')

package() {
    install -Dm644 'download:479705' "$pkgdir/usr/share/geany/filetypes.OpenSCAD.conf"
}
