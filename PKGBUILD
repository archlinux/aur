# Maintainer: angelsl <hidingfromhidden@gmail.com>
pkgname=android-sdk-ndk-symlink
pkgver=1
pkgrel=1
pkgdesc="A symlink to link the android-sdk and android-ndk AUR packages."
arch=(any)
license=('MIT')
depends=(android-sdk android-ndk)
source=()

package() {
	mkdir -p "$pkgdir/opt/android-sdk"
	ln -s "../android-ndk" "$pkgdir/opt/android-sdk/ndk-bundle"
}
