# Maintainer: Abby Pan <abbypan@gmail.com>
pkgname=rebol3_binary
pkgver=gbf237fc.static
pkgrel=1
pkgdesc="Rebol 3: Most software systems have become needlessly complex. We rebel against that complexity, fighting it with the most powerful tool available, language itself."
arch=('x86_64')
url=http://rebolsource.net/
groups=('devel')
provides=('rebol')
source=('r3::http://rebolsource.net/downloads/experimental/r3-linux-x64-gbf237fc-static')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/r3" "$pkgdir/usr/bin/r3"
}
