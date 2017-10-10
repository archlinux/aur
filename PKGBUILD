# Maintainer: Magnus Groß magnus dot gross 21 at gmail dot com
pkgname=ttf-dijkstra
pkgver=1
pkgrel=1
pkgdesc="A beautiful handwriting font of unknown origin, first popularized by E.W.Dijkstra."
arch=('i686' 'x86_64')
url="http://lucacardelli.name/indexartifacts.html"
source=("http://lucacardelli.name/Artifacts/Fonts/Pc/dijkstra.ttf")
md5sums=('SKIP')

package() {
	install -D "$srcdir/dijkstra.ttf" "$pkgdir/usr/share/fonts/TTF/dijkstra.ttf"
}

post_install() {
	fc-cache
}
