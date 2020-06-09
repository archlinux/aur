# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>
pkgbase=ngrok2-bin
pkgname=ngrok-bin
pkgver=2.3.35
pkgrel=1
pkgdesc="secure introspectable tunnels to localhost"
arch=(x86_64 aarch64)
url="https://ngrok.com"
license=('custom')
provides=(ngrok)
options=(!strip)
source=("LICENSE")
source_x86_64=("https://bin.equinox.io/a/jAq5uX8wfS8/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://bin.equinox.io/a/hm4nbCCX7iK/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums=("SKIP")
sha256sums_x86_64=("55df9c479b41a3b9b488458b5fb758df63001d14196a4126e3f669542c8727e9")
sha256sums_aarch64=("412a6d145ab61eae0012d2fbe111bf962e11327f11787d3d41d56ea97969fe04")


package() {
	install -D "$srcdir/ngrok" "$pkgdir/usr/bin/ngrok"
	install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

