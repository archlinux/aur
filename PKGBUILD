# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=elastic-query-export-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Export Data from ElasticSearch to CSV/JSON using a Lucene Query (e.g. from Kibana) or a raw JSON Query string."
arch=('x86_64')
url="https://github.com/pteich/elastic-query-export"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pteich/elastic-query-export/releases/download/v${pkgver}/elastic-query-export_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('93292ef47c8e143edce088a65a0224f8341dd3e40d688e0bd2718dc3ec9031868e32bc6ee5bedc37a119177e3d8881956a6dd8351d41f11dd959cb9b6bd9cf0d')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 elastic-query-export "$pkgdir/usr/bin/elastic-query-export"
}
