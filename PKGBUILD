# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=gomi-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="An rm alternative written in Go"
arch=('x86_64' 'i686')
url="https://github.com/b4b4r07/gomi"
license=('MIT')
provides=('gomi')
conflicts=('gomi')
source=('LICENSE')
source_x86_64=("gomi-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gomi_linux_x86_64.tar.gz")
source_i686=("gomi-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/gomi_linux_i386.tar.gz")
sha256sums=('9d7c5548147c0edf50d19add1ea927009b2fa9d34b425dc10eea9485f1607120')
sha256sums_x86_64=('e3669935e95eac76af7c9c35fb728ef06fcb1e2358f7a0157bc2f02d6dc5888b')
sha256sums_i686=('7f985566264ba3e663d9f1798bb4a4767a3b9cd5135016fa0aa5391fc0bd3d9c')

package() {
	install -Dm 755 gomi -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
