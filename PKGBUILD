# Maintainer: Carolina Mitchell <me@carolinamitchell.nz>
pkgname=keychron-c2-pro-8k-udev
pkgver=1.0.0
pkgrel=1
pkgdesc="A udev rule for the Keychron C2 Pro 8K keyboard to allow configuring through the Keychron Launcher"
arch=('any')
license=('GPL')
source=("70-keychron-c2-pro-8k.rules")
sha256sums=('eb5cd09dbf0accf777c94e75431ae34062f771afcfa2f0066827db7d709acf6b')

package() {
	install -Dm644 70-keychron-c2-pro-8k.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-c2-pro-8k.rules"
}
