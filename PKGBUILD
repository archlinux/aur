# Maintainer: Josh Baron <joshbaron48@outlook.com>

pkgname=palera1n-c
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool to jailbreak the iPhone X and older devices on iOS/iPadOS 15 and 16"
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n-c/releases/download/v2.0.0-beta.1/palera1n-linux-x86_64"
	"https://github.com/palera1n/palera1n-c/releases/download/v2.0.0-beta.1/palera1n.1")
sha256sums=('ed5871a79c891b2a71e1a689ea90e7390c53c30b909f3d64dd9ac0dfd4ab5e01'
            'ad67f4bd682e321d5f15c04884c4599066bf48bf8b682519dc0ce705d4116183')
package() {
	install -Dm755 "palera1n-linux-x86_64" "$pkgdir/usr/bin/palera1n"
	install -Dm644 "palera1n.1" "$pkgdir/usr/share/man/man1/palera1n.1"
}
