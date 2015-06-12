# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=geany-theme-slushpoppies
pkgdesc='Port of the Slush and Poppies from gedit-themes'
url='http://lara.craft.net.br'
pkgver=1
pkgrel=3
arch=(any)
license=('GPL')
depends=('geany')
source=("http://lara.craft.net.br/Geany/slushpoppies.conf")
md5sums=('a698b884463fe273db11ed75933b4ab2')

package() {
    install -Dm644 "$srcdir"/slushpoppies.conf "$pkgdir"/usr/share/geany/colorschemes/slushpoppies.conf
}
