# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gomi-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Rm alternative written in Go"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/b4b4r07/gomi"
license=('MIT')
provides=('gomi')
conflicts=('gomi')
source=('LICENSE')
source_x86_64=("gomi-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gomi_linux_x86_64.tar.gz")
source_i686=("gomi-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/gomi_linux_i386.tar.gz")
source_aarch64=("gomi-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gomi_linux_arm64.tar.gz")
sha256sums=('9d7c5548147c0edf50d19add1ea927009b2fa9d34b425dc10eea9485f1607120')
sha256sums_x86_64=('9fa9915b7c41dc81b49e943703b21f20e79298b76f00e02a2080b3175b7088d5')
sha256sums_i686=('d960099ad9d255894c3b0f44d88f27f144ab6e21013d604158707bb50f4dfc3f')
sha256sums_aarch64=('380673b070aba39befbe60496fa5789d2b0010bf271784b998486237a1e2cf04')

package() {
	install -D gomi -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
