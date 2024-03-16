# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=nagiosql
pkgver=3.5.0
pkgrel=1
pkgdesc="NagiosQL - nagios configurator"
arch=('i686' 'x86_64')
url="http://www.nagiosql.org/"
license=('BSD')
groups=()
depends=('php' 'mysql' 'nagios')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://downloads.sourceforge.net/project/nagiosql/nagiosql/NagiosQL%203.5.0/$pkgname-3.5.0-git2023-06-18.tar.gz")
noextract=()
md5sums=('d2736f68479786260a1af1e14f5c5154')

package() {
  _base="$pkgdir/srv/http"
  mkdir -p  $_base
  mv "$srcdir/${pkgname}-3.5.0" $_base/
}

# vim:set ts=2 sw=2 et:

