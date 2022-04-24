
# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
pkgname=ferium-bin
pkgver=3.20.1
pkgrel=1
pkgdesc="Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases."
arch=("x86_64")
url="https://github.com/theRookieCoder/ferium"
license=('MPL')
source=("https://github.com/theRookieCoder/ferium/releases/download/v$pkgver/ferium-linux-gnu.zip"
	"ferium.desktop")
md5sums=('SKIP'
	'SKIP')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 

	install -Dm644 -t "$pkgdir/usr/share/applications" ferium.desktop
}
