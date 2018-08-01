
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=qtcdrp
pkgver=1.1.3
pkgrel=0
pkgdesc="Qt Creator Discord Rich Presence Module"
arch=("x86_64")
url="https://github.com/vicr123/QtcDRP"
license=('GPL3')
depends=('qt5-base' 'qtcreator' 'discord-rpc-api')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/QtcDRP/releases/download/v1.1.3/linux-release.tar.gz')
md5sums=('5a15d748bb3232ca6d69246b806b537c')

package() {
	mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
	cp libQtCreatorDiscordRichPresence.so "$pkgdir/usr/lib/qtcreator/plugins"
}
