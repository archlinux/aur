# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=geany-theme-retro
pkgdesc='A green retro theme for geany'
url='http://lara.craft.net.br'
pkgver=1
pkgrel=3
arch=(any)
license=('GPL')
depends=('geany')

source=("http://lara.craft.net.br/Geany/retro.conf")
md5sums=('beaf14e5aa25d73230d09c8bf43be127')

package() {
    install -Dm644 "$srcdir"/retro.conf "$pkgdir"/usr/share/geany/colorschemes/retro.conf
}
