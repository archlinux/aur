# Maintainer: < luluco250 at gmail dot com >

pkgname=qcom-battery-tlp-switch-udev
pkgver=1.0
pkgrel=1
pkgdesc='Udev rule to auto switch TLP modes on Qualcomm platforms like the Thinkpad X13s'
arch=('aarch64')
depends=('udev' 'tlp')
license=('MIT')
source=('99-qcom-battery-tlp-switch.rules')
sha256sums=('c6ef7f855982f1cdc7520a2532ee37381650c05aa9626a075ca40e31ca3b37bc')
install='qcom-battery-tlp-switch-udev.install'

package() {
	install -Dm644 "$srcdir/99-qcom-battery-tlp-switch.rules" -t "$pkgdir/usr/lib/udev/rules.d"
}
