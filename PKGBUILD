# Maintainer: James An <james@jamesan.ca>

_pkgname=solr
pkgname="${_pkgname}5-war"
pkgver=5.2.1
pkgrel=1
pkgdesc='Solr / SolrCloud web application archive (WAR) ready to deploy on any Java EE container'
arch=('any')
url="http://lucene.apache.org/$_pkgname"
license=('Apache')
depends=('java-environment>=7')
provides=("$_pkgname=5" "${_pkgname}5=5")
source=("https://github.com/bremeld/$_pkgname-undertow/raw/master/example/$_pkgname-wars/$_pkgname-$pkgver.war")
noextract=("$(basename --multiple ${source[@]})")
md5sums=('592258911be0a39ca8751f6ee6157763')

package() {
  install -Dm644 "$_pkgname-$pkgver.war" "$pkgdir/usr/share/java/lib/$_pkgname/$_pkgname-$pkgver.war"
}
