# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shaarli-material"
pkgver=0.12.1
pkgrel=1
pkgdesc="A theme for Shaarli, the famous personal, minimalist, super-fast, database free, bookmarking service"
url="https://github.com/kalvn/Shaarli-Material"
license=("MIT")
arch=("any")
depends=("shaarli")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname.v$pkgver.tar.gz")
sha256sums=('7579741765e8b0e7805a78030b7bd3967291415fa88c05a92ffce46fb8f3358e')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/shaarli/tpl"
 cp -r "material" "$pkgdir/usr/share/webapps/shaarli/tpl"
}
