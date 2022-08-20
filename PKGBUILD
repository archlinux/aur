# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=netrunner-bin
pkgver=2.0b21
pkgrel=2
pkgdesc="NetRunner is a telnet client originally developed in the late 90s in sync with the release of Windows XP."
arch=("i686" "x86_64")
url="http://www.mysticbbs.com/"
license=("unknown")
depends=("sdl")
optdepends=("cryptlib: SSH support")
install="$pkgname.install"
source_i686=("http://www.mysticbbs.com/downloads/nr21_l32.zip")
source_x86_64=("http://www.mysticbbs.com/downloads/nr21_l64.zip")
source=("netrunner.sh" "netrunner.desktop")
sha256sums_i686=("e10514d9351bc490195cc8205bad300b4115f9c59c53ad78c7a3a6e76d674226")
sha256sums_x86_64=("751cfc3de23dca673cb6619525b251cbd463751b6c5e250faf30392986de8c86")
sha256sums=("0bb2148b98f647aa7d49ef7ac17cf01817f0c5c322b20c19d736bb4812edc21d"
	"0f570f105afad92b27d31c5a0cd7bc58bc8a7bdaba7f726c4ba06a1591484e99")

package() {
	cd "$srcdir/"

	install -Dm 755 netrunner.sh "$pkgdir"/usr/bin/netrunner
	install -Dm 644 netrunner.desktop "$pkgdir"/usr/share/applications/netrunner.desktop

	install -Dm 755 file_id.ans "$pkgdir"/usr/share/netrunner/file_id.ans
	install -Dm 755 file_id.diz "$pkgdir"/usr/share/netrunner/file_id.diz
	install -Dm 755 netrunner "$pkgdir"/usr/share/netrunner/netrunner
	install -Dm 755 netrunner.icn "$pkgdir"/usr/share/netrunner/netrunner.icn
	install -Dm 755 netrunner.ini "$pkgdir"/usr/share/netrunner/netrunner.ini
	install -Dm 755 netrunner.manual.txt "$pkgdir"/usr/share/netrunner/netrunner.manual.txt
	install -Dm 755 whatsnew.txt "$pkgdir"/usr/share/netrunner/whatsnew.txt
}
