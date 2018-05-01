
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=qtcdrp
pkgver=1.1
pkgrel=3
pkgdesc="Qt Creator Discord Rich Presence Module"
arch=("x86_64")
url="https://github.com/vicr123/QtcDRP"
license=('GPL3')
depends=('qt5-base' 'qtcreator' 'discord-rpc-api')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/QtcDRP/releases/download/v1.1.2/linux-release.tar.gz')
md5sums=('2b41d48865dda0c7da16d3e3102115ed')

package() {
	mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
	cp libQtCreatorDiscordRichPresence.so "$pkgdir/usr/lib/qtcreator/plugins"
}
