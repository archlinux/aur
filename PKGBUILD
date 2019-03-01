# Maintainer: james58899 <james59988 at gmail dot com>
# Contributor: copygirl <copygirl@mcft.net>

pkgname=pulseaudio-arctis-pro-wireless
pkgver=1.0
pkgrel=1
pkgdesc="Configuration files to support SteelSeries Arctis Pro Wireless mono/stereo output on pulseaudio"
arch=("any")
license=("LGPL")
depends=("pulseaudio")
source=("90-pulseaudio-arctis-pro-wireless.rules")
md5sums=('b886fb65a79adce4dfd8c0990176bbd5')

package() {
	install -Dm0644 90-pulseaudio-arctis-pro-wireless.rules "$pkgdir"/usr/lib/udev/rules.d/90-pulseaudio-arctis-pro-wireless.rules
}
