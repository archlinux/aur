# Contributor: Cassandra Watergate <cassandrajwatergate at gmail dot com>

pkgname=plzip-lzip-link
pkgver=1.12
pkgrel=1
pkgdesc="Replace lzip with plzip for performance"
url="https://www.nongnu.org/lzip/plzip.html"
arch=('any')
license=('GPL-2.0-or-later')
depends=('plzip')
provides=('lzip')
conflicts=('lzip')

package() {
  install -d "$pkgdir"/usr/{bin,share/{info,man/man1}}
  ln -sv /usr/bin/plzip "$pkgdir/usr/bin/lzip"
  ln -sv /usr/share/info/plzip.info.gz "$pkgdir"/usr/share/info/lzip.info.gz
  ln -sv /usr/share/man/man1/plzip.1.gz "$pkgdir"/usr/share/man/man1/lzip.1.gz
}
