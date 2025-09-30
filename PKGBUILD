#shellcheck shell=bash
# Maintainer: shadichy <shadichy@blisslabs.org>

pkgname='grub-android-prober'
pkgver='0.1.4'
pkgrel='1'
pkgdesc='GRUB Configuration for Android detection (Only works with some sort of filesystems)'
arch=('any')
license=('GPLv3')
url='https://github.com/shadichy/grub-android-x86.git'
depends=('grub' 'bash')
source=('30_android-prober' 'grub-android-prober')
sha512sums=('b995676f79d6f8d10503dc7aeb93647b8d9ad5db9dd939e0d72045f221afb6e9377da1c668316e7d66f0fb65e664b175607364e38981e8161d0f7546188957c3' '4a93019c951f3bd12a68c5f1b5d9337fe5f7c4732aac80de17ba76d667410c997ed521dcb2457b10eaab124a08b7f3ba917022a11545082d82f2456547d57523')

package() {
	cd "$srcdir"
	install -Dm755 "30_android-prober" "$pkgdir/etc/grub.d/30_android-prober"
	install -Dm755 "grub-android-prober" "$pkgdir/usr/bin/grub-android-prober"
}
