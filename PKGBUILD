# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: BlackICE <blackice@craft.net.br>

pkgname=geany-checkpath
pkgdesc='Geany wrapper for autodetect permissions/root'
url='http://lara.craft.net.br/'

pkgver=2.3
pkgrel=4
arch=('any')

license=('GPL')

depends=('sudo' 'geany')

source=('http://lara.craft.net.br/geany-checkpath.sh')
md5sums=('d5641706739e486128ba71b5e73ccdb9')

package() {
	install -Dm755 "$srcdir"/geany-checkpath.sh "$pkgdir"/usr/bin/geany_checkpath
}
