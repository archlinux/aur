# Maintainer: shadichy <shadichy.dev@gmail.com>

pkgname='grub-android-prober'
pkgver='0.1.1'
pkgrel='1'
pkgdesc='GRUB Configuration for Android detection (Only works with some sort of filesystems)'
arch=('any')
license=('GPLv3')
url='https://github.com/shadichy/grub-android-x86.git'
depends=('grub' 'bash')
source=('30_android-prober' 'grub-android-prober')
sha512sums=( '371fb09e5dc1d3f0488641ffd0fcd59c6615452f3ac77f3506d0f83be060e506027c38fd31139670038ac3230f12f3db89b5ff737deadd11d59d385bee1272d6' 'b6da4768bf1a55a3de2db649ffdbbf9a5e52828c7b0b2388f5773670416858698997ca8ab7b3bcfc0f4a2e1bc432eba5ebd3375a966e7ce6d4ff599e645c603c' )

package() {
	cd "$srcdir"
	install -Dm755 "30_android-prober" "$pkgdir/etc/grub.d/30_android-prober"
	install -Dm755 "grub-android-prober" "$pkgdir/usr/bin/grub-android-prober"
}
