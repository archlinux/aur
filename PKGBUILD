# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: decay_of_mind <asparagus.maximus@gmail.com>
# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=weatherboy
pkgver=20141027
pkgrel=4
pkgdesc="Lightweight weather GTK tray application."
arch=('any')
url="https://github.com/decayofmind/weatherboy"
license=('GPL')
depends=(python2 gtk2)
makedepends=()
source=("https://raw.githubusercontent.com/decayofmind/$pkgname/r-$pkgver/$pkgname.py")
md5sums=('SKIP')

package () {
  cd "$srcdir"
  install -D -m 0755 weatherboy.py "$pkgdir"/usr/bin/weatherboy
}
