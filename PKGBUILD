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
	'3c35a20767b3c770b60774b0bbf2a06e5b2cd19e6654c9453e404df1fc519ad5abec2857d1c066fa39bd5f1c4e2bf97e23d3c10b34617770142bdad375de212d'
)

package() {
	cd "$srcdir"
	install -Dm755 30_android-x86.sh "$pkgdir/etc/grub.d/30_android-x86.sh"
}
