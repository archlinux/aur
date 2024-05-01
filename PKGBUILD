# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=aw87xxx-acf-firmware
pkgver=8.0.1.10
pkgrel=1
pkgdesc='Firmware for Awinic aw87xx audio devices (extracted from Ayaneo Windows drivers)'
arch=('x86_64')
license=('unknown')
_archive_name="AYANEO_AIR_1S"
source=(
	"$_archive_name.rar::https://drive.usercontent.google.com/download?id=1b-GBkKwBTkE_LvY9XR4PEatS4F3IeeZU&confirm=xxx"
)
sha256sums=(
	'0ffd4472878044fb4d68ea62613a79c3384f42d2cba58241ebfbf1d0072de011'
)

package() {
	install -Dm644 \
		"$srcdir/$_archive_name/05_Audio/AW87XXX_Driver_X64_Windows_V$pkgver/Driver/Signed/awinic_smartk_acf.bin" \
		"$pkgdir/usr/lib/firmware/aw87xxx_acf.bin"
}
