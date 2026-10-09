# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_sys='20.0-20260927'
_pkgver_vendor='20.0-20260927'
_pkgver_images_vendor=$_pkgver_vendor
_pkgver_images_vendor_x86=$_pkgver_vendor
_pkgver_images_vendor_arm=$_pkgver_vendor
_pkgver_images_vendor_arm64=$_pkgver_vendor
_pkgver_images_system=$_pkgver_sys
_pkgver_images_system_x86=$_pkgver_sys
_pkgver_images_system_arm=$_pkgver_sys
_pkgver_images_system_arm64=$_pkgver_sys
pkgname=waydroid-image
pkgver='20.0.20260510'
pkgrel=1
epoch=1
pkgdesc="LineageOS-based Android images for Waydroid"
arch=(x86_64 i686 armv7h aarch64)
url='https://waydro.id'
license=('GPL-3.0-only')
optdepends=(waydroid)
_srcprefix='https://sourceforge.net/projects/waydroid/files/images'
source_x86_64=("$_srcprefix/system/lineage/waydroid_x86_64/lineage-$_pkgver_images_system-VANILLA-waydroid_x86_64-system.zip"
               "$_srcprefix/vendor/waydroid_x86_64/lineage-$_pkgver_images_vendor-MAINLINE-waydroid_x86_64-vendor.zip")
source_i686=("$_srcprefix/system/lineage/waydroid_x86/lineage-$_pkgver_images_system_x86-VANILLA-waydroid_x86-system.zip"
             "$_srcprefix/vendor/waydroid_x86/lineage-$_pkgver_images_vendor_x86-MAINLINE-waydroid_x86-vendor.zip")
source_armv7h=("$_srcprefix/system/lineage/waydroid_arm/lineage-$_pkgver_images_system_arm-VANILLA-waydroid_arm-system.zip"
               "$_srcprefix/vendor/waydroid_arm/lineage-$_pkgver_images_vendor_arm-MAINLINE-waydroid_arm-vendor.zip")
source_aarch64=("$_srcprefix/system/lineage/waydroid_arm64/lineage-$_pkgver_images_system_arm64-VANILLA-waydroid_arm64-system.zip"
                "$_srcprefix/vendor/waydroid_arm64/lineage-$_pkgver_images_vendor_arm64-MAINLINE-waydroid_arm64-vendor.zip")
sha256sums_x86_64=('053552725bf4ae25e2d3f7e6f1947203294aa9d73dc17fe1f3abe646e5d3bd8a'
                   'd911b8353f6c807b94790b1c41c67e863a9f3dcd1cf3ec0232351398235afd7a')
sha256sums_i686=('be42a16bc10ea14ce44e1fc67c046dd2d85171f03d135fd13fcddc6796951702'
                 '99af2f69d5fd2c1f2d3830183f6de9689375833ac082e16cc5c9a94cd953990e')
sha256sums_armv7h=('c36f1298165c572c803c0d76ed6086d37e7639dbb3d8bcec0f5e16984e494152'
                   '335c710902148cf6f4edac5e7ab464f1af536deb460eb81facd31b9557cec1e7')
sha256sums_aarch64=('5fb8179ed4455f45919c5a2bfbfdd1591619295994ad321217f03bb1dcfc53a7'
                    '20a49c11961a5ac7295320f578764eeab3c982b217f1bfde7473adfc22e747ae')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}
