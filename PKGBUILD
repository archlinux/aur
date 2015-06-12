# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=geany-theme-gedit
pkgdesc='Port of the oficial gedit theme'
url='http://lara.craft.net.br'
pkgver=1
pkgrel=3
arch=(any)
license=('GPL')
depends=('geany')
source=("http://lara.craft.net.br/Geany/gedit.conf")
md5sums=('cff5659021919f07eddf7c1c5cd8ab2c')

package() {
    install -Dm644 "$srcdir"/gedit.conf "$pkgdir"/usr/share/geany/colorschemes/gedit.conf
}
