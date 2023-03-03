# Maintainer: greg erwin 256 at gmail dot com
pkgname=signal-hound-udev
pkgver=1.0
pkgrel=1
pkgdesc="Udev rule for Signal Hound BB60, SM200, SM435, and VSG60"
arch=('x86_64')
url="https://signalhound.com/software/"
license=('custom')
source=('40-signal-hound.rules')
sha1sums=('3b94991edf50de9b73ebb58dd2c3dce2582cccc6')

package() {
	install -Dm 644 40-signal-hound.rules -t $pkgdir/usr/lib/udev/rules.d/
}
