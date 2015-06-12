# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=geany-theme-github
pkgdesc='A github like theme for Geany'
url='http://lara.craft.net.br'
pkgver=1
pkgrel=3
arch=(any)
license=('GPL')
depends=('geany')
source=("http://lara.craft.net.br/Geany/github.conf")
md5sums=('16cd235a443dbf3bed3c85096869e60c')

package() {
    install -Dm644 "$srcdir"/github.conf "$pkgdir"/usr/share/geany/colorschemes/github.conf
}
