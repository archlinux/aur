#  Maintainer: Matthew Hague <matthewhague@zoho.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgname=mutt_vc_query
pkgver=002
pkgrel=1
pkgdesc="Query vCard database from mutt using query_command, part of rolo"
arch=('i686' 'x86_64')
url="http://rolo.sourceforge.net"
license=('GPL')
depends=('libvc')
source=('http://sourceforge.net/projects/rolo/files/mutt_vc_query/002/mutt_vc_query-002.tar.gz')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('152ca5b108b259ddeb7f85768c577ed5')
sha256sums=('28cd22818beee4193b5068eb85dfbf06042e67972b2e1f0821fb88b806ed6f85')
