# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=sentinl
basever=6.6
pkgver=${basever}.1
pkgrel=2
pkgdesc="Siren Platform + Kibana Alert & Report App for Elasticsearch"
url="https://github.com/sirensolutions/sentinl"
arch=('any')
license=('Apache')
depends=("kibana>=$basever.0")
source=("https://github.com/sirensolutions/sentinl/releases/download/tag-${basever}.0-0/sentinl-v${pkgver}.zip")
sha256sums=('9d226cf0c63f290474f723a3e922f2119a3f3ee2af3488b02e6f9954b20b00f8')

package() {
	cd "$srcdir"
	install -dm 0755 "$pkgdir/usr/share/kibana/plugins"
	cp -r "$srcdir/kibana/$pkgname" "$pkgdir/usr/share/kibana/plugins"
}
