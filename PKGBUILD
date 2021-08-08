# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=darktile-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="A GPU-rendered terminal emulator designed for tiling window managers"
arch=('x86_64')
url="https://github.com/liamg/darktile"
license=('MIT')
depends=('libgl' 'libx11')
provides=('darktile')
conflicts=('darktile')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/darktile-linux-amd64"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/liamg/darktile/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/liamg/darktile/v$pkgver/README.md")
sha256sums=('618727950b870d910669b291793580bcaa04117531b4502aaa7ae5ca7e551eac'
            '58420d88b82b14fb713a9a1725146c154b9a7edbc0f372e36e33e32ef1050547'
            '7f3e2be8b9711eca6d07f52ae7b0233fec0d35909e54540ed55164fcf1106c57')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/darktile"
	install -Dm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
