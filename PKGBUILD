# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=elastic-query-export-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Export Data from ElasticSearch to CSV/JSON using a Lucene Query (e.g. from Kibana) or a raw JSON Query string."
arch=('x86_64')
url="https://github.com/pteich/elastic-query-export"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pteich/elastic-query-export/releases/download/v${pkgver}/elastic-query-export_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('c47a94663bb2c6281cdd6725aef930c81e2074ce9bc8ff3cc22aac6e4d4e6dcb94c7d2c1e237d8ab7d6ce5f469c54798b0083c2b1cee99867b8a8a624342f4a6')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 elastic-query-export "$pkgdir/usr/bin/elastic-query-export"
}
