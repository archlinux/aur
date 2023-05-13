# Maintainer: shadichy <shadichy.dev@gmail.com>

pkgname='grub-android-x86'
pkgver='0.0.2'
pkgrel='1'
pkgdesc='GRUB Configuration for Android x86 detection (Only works with NTFS, extFS and vFat/exFat)'
arch=('any')
license=('MIT')
url='https://github.com/shadichy/grub-android-x86.git'
depends=('grub' 'bash')
source=('30_android-x86.sh')
sha512sums=(
	'4e5850d7bf6cc66ec5f9a2358b817aea0d10e65e9ff3a091657340943d44a6f021ef038d7ca47bb383b99091c806a5aa3ec10f4669200f160c00d84d88597d63'
)

package() {
	cd "$srcdir"
	install -Dm755 30_android-x86.sh "$pkgdir/etc/grub.d/30_android-x86.sh"
}
