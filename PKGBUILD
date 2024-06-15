# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=elastic-query-export-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Export Data from ElasticSearch to CSV/JSON using a Lucene Query (e.g. from Kibana) or a raw JSON Query string."
arch=('x86_64')
url="https://github.com/pteich/elastic-query-export"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pteich/elastic-query-export/releases/download/v${pkgver}/elastic-query-export_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('75c76c5c1627179e497726904d5145883f880bf6365e203aa89ec99dda27703f6d0de9fe6298c705e2370a440be18cd99413e4ade96766cfd484daceb3c65b07')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 elastic-query-export "$pkgdir/usr/bin/elastic-query-export"
}
