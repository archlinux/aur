# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rmd-bin"
pkgver=3.1.5
pkgrel=1
pkgdesc="Scrapes Reddit to download media of your choice"
url="https://github.com/shadowmoose/RedditDownloader"
license=("custom:none")
arch=("x86_64")
source=("rmd-$pkgver::$url/releases/download/$pkgver/RMD-ubuntu")
sha256sums=('bc6df5d89a8bab9d409eb7c4dfbd31167988e5e3f50bd3663d2dc44868a48567')
options=(!strip)

package(){
 install -D -m 755 "rmd-$pkgver" "$pkgdir/usr/bin/rmd"
}
