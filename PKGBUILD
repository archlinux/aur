# Maintainer: shadichy <shadichy.dev@gmail.com>

pkgname='grub-android-x86'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='GRUB Configuration for Android x86 detection (Only works with NTFS, extFS and vFat)'
arch=('any')
license=('MIT')
url='https://github.com/shadichy/grub-android-x86.git'
depends=( 'grub' 'bash' )
source=( '30_android-x86.sh' )
sha512sums=( 'SKIP' )

package() {
	cd "$srcdir"
	install -Dm755 30_android-x86.sh "$pkgdir/etc/grub.d/30_android-x86.sh"
}
