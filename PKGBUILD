# Maintainer: James An <james@jamesan.ca>

_pkgname=solr
pkgname="${_pkgname}5-zip"
pkgver=5.3.1
pkgrel=1
pkgdesc='Popular, blazing fast open source enterprise search platform from the Apache Lucene project'
arch=('any')
url="http://lucene.apache.org/$_pkgname"
license=('Apache')
depends=('java-environment>=7')
provides=("$_pkgname=5" "${_pkgname}5=5")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("http://www.apache.org/dist/lucene/$_pkgname/$pkgver/$_pkgname-$pkgver.zip")
md5sums=('c69eb24acb3821408eacf00651cc7022')
noextract=("${source[@]%%::*}")

package() {
  install -Dm644 "$_pkgname-$pkgver.zip" "$pkgdir/usr/share/java/lib/$_pkgname/$_pkgname-$pkgver.zip"
}
