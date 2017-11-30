
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=qtcdrp
pkgver=1.1
pkgrel=1
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/QtcDRP"
license=('GPL3')
depends=('qt5-base' 'qtcreator' 'discord-rpc-api')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/QtcDRP/releases/download/v1.1.1/linux-release.tar.gz')
md5sums=('9f8b24f8059b3c269f43b523f055d361')

package() {
	mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
	cp libQtCreatorDiscordRichPresence.so "$pkgdir/usr/lib/qtcreator/plugins"
}
