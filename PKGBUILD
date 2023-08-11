# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="hyenae-ng"
pkgver=0.10
pkgrel=1
pkgdesc="An advanced cross-platform network packet generator"
url="https://github.com/r-richter/hyenae-ng"
license=("GPL3")
arch=("x86_64" "aarch64" "armv7h")
depends=("libpcap")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7215d64544529e96cd10008e0dbcba3d07dfd1e8289c55f0a57cd34b8f724fd')

build(){
 cd "$pkgname-$pkgver"
 make all
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m 755 "hyenae-ng" "$pkgdir/usr/bin/hyenae-ng"
}
