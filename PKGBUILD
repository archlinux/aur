# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shaarli-material"
pkgver=0.16.5
pkgrel=1
pkgdesc="A theme for Shaarli, the famous personal, minimalist, super-fast, database free, bookmarking service"
url="https://github.com/kalvn/Shaarli-Material"
license=("MIT")
arch=("any")
depends=("shaarli")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname.v$pkgver.tar.gz")
sha256sums=('397992ca46f6659d3f304ddc05a5a51363cf3b96eb1fee803a099e5f6cc4ec86')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/shaarli/tpl"
 cp -r "material" "$pkgdir/usr/share/webapps/shaarli/tpl"
}
