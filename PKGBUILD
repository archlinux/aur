# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase-driver-csv"
pkgver=1.3.1
pkgrel=2
pkgdesc="CSV driver for Metabase"
arch=("any")
url="https://github.com/Markenson/csv-metabase-driver"
license=("custom:none")
depends=("metabase")
source=("$url/releases/download/v$pkgver/csv.metabase-driver.jar")
sha256sums=('1b6f3868a7bfc31ff4ba9da30e44b89fcc1ee3a87bbeb73bafe675a8a846e193')
noextract=("csv.metabase-driver.jar")
options=("!strip")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 644 "csv.metabase-driver.jar" -t "$pkgdir/var/lib/metabase/plugins"
}
