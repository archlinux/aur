# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=geany-theme-oblivion2
pkgdesc='Port of the Oblivion2 theme from gedit-themes'
url='http://lara.craft.net.br'
pkgver=1
pkgrel=3
arch=(any)
license=('GPL')
depends=('geany')
source=("http://lara.craft.net.br/Geany/oblivion2.conf")
md5sums=('6a7be917b8c7b27149d2ef86d9b19521')

package() {
    install -Dm644 "$srcdir"/oblivion2.conf "$pkgdir"/usr/share/geany/colorschemes/oblivion2.conf
}
