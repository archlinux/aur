# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: enamulhasanabid <enamulhabid at gmail dot com>
# Contributor: éclairevoyant
# Contributor: dangerdev <dangerdev at disroot dot org>
# Contributor: Danct12 <danct12 at disroot dot org>
# Contributor: Bart Ribbers <bribbers at disroot dot org>

_pkgver_sys='20.0-20260302'
_pkgver_vendor='20.0-20260302'
_pkgver_images_vendor=$_pkgver_vendor
_pkgver_images_vendor_x86=$_pkgver_vendor
_pkgver_images_vendor_arm='20.0-20260301'
_pkgver_images_vendor_arm64='20.0-20260301'
_pkgver_images_system=$_pkgver_sys
_pkgver_images_system_x86=$_pkgver_sys
_pkgver_images_system_arm='20.0-20260301'
_pkgver_images_system_arm64='20.0-20260301'
pkgname=waydroid-image
pkgver='20.0.20260304'
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
sha256sums_x86_64=('21edfae3f265f21dd2ae3cfb5e5dd9b614b6862c89bd9784c6557652e3c8e4f6'
                   '132b67715f7686d4bd47e4a6715fba3275973c1e6a640b7a2dd1055bcba50108')
sha256sums_i686=('d73a84994bacaeeb98ccdbd0b97f1f4b1848984193abebeaf029aa8ac17816f1'
                 'dfdea9ceee00d6290f022a9ca4714681b6aca57c16e927803373db7282f1f508')
sha256sums_armv7h=('6b408c02356359dc2274c296faa0af77ae168302b1deb9e40f2917dd0b585b2e'
                   'c4515e753e60fc878ab45fa602836e15bd563b7e2481494fc68599d2722f12d4')
sha256sums_aarch64=('c58eb56d5e9521267994688ab386559f090b2dad14698d1f92d72c9e22be9ae9'
                    '211cbd6fd5964c409830f767ed9f89406e48aaed06370fa8d42cfea210f2a04a')

package() {
	install -Dm644 {system,vendor}.img -t "$pkgdir/usr/share/waydroid-extra/images/"
}
