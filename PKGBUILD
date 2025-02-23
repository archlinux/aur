# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=elastic-query-export-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="Export Data from ElasticSearch to CSV/JSON using a Lucene Query (e.g. from Kibana) or a raw JSON Query string."
arch=('x86_64')
url="https://github.com/pteich/elastic-query-export"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pteich/elastic-query-export/releases/download/v${pkgver}/elastic-query-export_${pkgver}_linux_amd64.tar.gz")
sha512sums=('6cdf30e00d730332b31f7c559abdf3ec55be130867d89644b347603e5c75e3ce1866c75c3ed9d17b58e84e2524917fff972d3b113b82bfb1f58a77393dbf21ce')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 elastic-query-export "$pkgdir/usr/bin/elastic-query-export"
}
