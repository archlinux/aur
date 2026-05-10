# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_sys='20.0-20260403'
_pkgver_vendor='20.0-20260403'
_pkgver_images_vendor='20.0-20260428'
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
sha256sums_x86_64=('2e343b14c649a685853e7957ac34feb1ca110425d78a47ebad764caae24116a8'
                   'cba35433ffca73ed349e096b1daec495b3204e01c0e541c4203671e6d648e874')
sha256sums_i686=('7ec24e44b7b80b7bc57e77cf8c94f3f53c669b8f30cb1df560602616dae477ef'
                 '03f1dfc41b0f37471843c1f2ecb72bc635e8ddf6ecd80b2c41ec6ef8ebe303a7')
sha256sums_armv7h=('4d3d1a3631165118a0ad43d84ae84bf3f0207c429148747e59d4485727107a68'
                   'b81703ff498af328ffe39354a8d9956be51a184fa319e2648964910d35ba9673')
sha256sums_aarch64=('c4b45fad36bee7c0db8a1d9315a5be0035520c53d3d005a807735ae9b7ee79cf'
                    '1e6d33d464277ea3964e4658001c8882f21325616d6bcc66d473bc9ee1e246c7')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}
