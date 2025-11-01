# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_sys='20.0-20250823'
_pkgver_vendor='20.0-20250809'
_pkgver_images_vendor=$_pkgver_vendor
_pkgver_images_vendor_x86=$_pkgver_vendor
_pkgver_images_vendor_arm=$_pkgver_vendor
_pkgver_images_vendor_arm64=$_pkgver_vendor
_pkgver_images_system=$_pkgver_sys
_pkgver_images_system_x86='20.0-20251011'
_pkgver_images_system_arm='20.0-20251019'
_pkgver_images_system_arm64='20.0-20251011'
pkgname=waydroid-image
pkgver='20.0.20251101'
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
sha256sums_x86_64=('76d8faf85e330452e844df86244c012177a22e59e58f4d6b09f7cd2dc8507159'
                   '14df3ffc773a30c2c157fa6f97e6c79338990b60ac85d69559bbfb82772650ef')
sha256sums_i686=('496370f86b2372c12c9e903432c1cf390e90f50abd937f973e46ef0098dc58b3'
                 '77f5b7054f845c400246ad0b0764da3c6e4f87ade5abc040d81534eb9559f129')
sha256sums_armv7h=('5e2ca0c8b6aab46d95a9588b30d6a0f22729f2da18ed980c106ddf3d73a4f37b'
                   '311cff66435a5c41ea208473a3ec668ec617042eda7a94899de9a26f301b0577')
sha256sums_aarch64=('c95b1bae600226fad7aaa4c92100f69d2bec8276c8d5808076927cf29e97e212'
                    'da43b4a822d6951e2c6ee4c18e59ce2f44b505d70a0e942c3a99c9b39345e59c')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}
