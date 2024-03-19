# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="pretzel-web"
pkgver=1.0.0
pkgrel=2
pkgdesc="Open-source, browser-local data exploration using DuckDB-Wasm and PRQL"
url="https://pretzelai.github.io/"
license=("Apache-2.0")
arch=("any")
source=("$pkgname.zip::https://github.com/pretzelai/pretzelai.github.io/archive/refs/heads/main.zip")
b2sums=("SKIP")

package(){
 install -d "$pkgdir/usr/share/webapps"
 mv "pretzelai.github.io-main" "$pkgdir/usr/share/webapps/pretzel"
}
