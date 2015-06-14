# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=nagiosql
pkgver=3.2.0
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
source=("http://downloads.sourceforge.net/project/nagiosql/nagiosql/NagiosQL%203.2.0/$pkgname_320.tar.gz")
noextract=()
md5sums=('6a0a533fa220cce7a6123d8481d99b61')

build() {
  _base="$pkgdir/srv/http"
  mkdir -p  $_base
  mv "$srcdir/${pkgname}32" $_base/
}

# vim:set ts=2 sw=2 et:

