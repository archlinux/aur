# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
pkgname=kodelife
pkgver=0.5.1.0
pkgrel=1
license=('unknown')
arch=('x86_64')
depends=('libcurl-gnutls')
source=("https://hexler.net/pub/kodelife/pkgname-$pkgver-linux-$arch.zip")
sha256sums=('266a4b8e0d7cd2dd63ad56c9d1fd5e164265b41a6b7be4e39000541ba9f6c199')

package() {
	install -D -m755 "$srcdir/KodeLife" "$pkgdir/usr/bin/KodeLife"
}
