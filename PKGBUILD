# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=darktile-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="A GPU-rendered terminal emulator designed for tiling window managers"
arch=('x86_64')
url="https://github.com/liamg/darktile"
license=('MIT')
depends=('libgl' 'libx11')
provides=('darktile')
conflicts=('darktile')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/liamg/darktile/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/liamg/darktile/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/darktile-linux-amd64")
sha256sums=('58420d88b82b14fb713a9a1725146c154b9a7edbc0f372e36e33e32ef1050547'
            '7f3e2be8b9711eca6d07f52ae7b0233fec0d35909e54540ed55164fcf1106c57')
sha256sums_x86_64=('3671bc6fbaaa968e2b2b0779be4884753acc77be76889039109c511c594a627a')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/darktile"
	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
