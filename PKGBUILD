# Maintainer: Rein Fernhout public@reinfernhout.xyz
pkgname=cao
pkgver=1.0.1
pkgrel=1
pkgdesc="Script to easily change your audio output device for PulseAudio"
arch=("any")
url="https://github.com/LevitatingBusinessMan/cao"
license=("MIT")
depends=("nodejs" "pulse-native-provider")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LevitatingBusinessMan/cao/archive/$pkgver.tar.gz")
md5sums=("41dd303e7505a860edd890648a25c9d4")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
