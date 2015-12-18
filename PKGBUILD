# Maintainer: James An <james@jamesan.ca>

_pkgname=solr
pkgver=1.4.1
pkgname="${_pkgname}${pkgver:0:3}-war"
pkgrel=1
pkgdesc='Solr / SolrCloud web application archive (WAR) ready to deploy on any Java EE container'
arch=('any')
url="http://lucene.apache.org/$_pkgname"
license=('Apache')
depends=('java-environment>=7')
provides=("$_pkgname=$pkgver" "${_pkgname}${pkgver:0:3}=$pkgver")
source=("http://archive.apache.org/dist/lucene/$_pkgname/$pkgver/apache-$_pkgname-$pkgver.tgz")
md5sums=('258a020ed8c3f44e13b09e8ae46a1c84')

package() {
  install -Dm644 "apache-$_pkgname-$pkgver/dist/apache-$_pkgname-$pkgver.war" "$pkgdir/usr/share/java/lib/$_pkgname/$_pkgname-$pkgver.war"
}
