
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=qtcdrp
pkgver=1.1
pkgrel=2
pkgdesc="Qt Creator Discord Rich Presence Module"
arch=("x86_64")
url="https://github.com/vicr123/QtcDRP"
license=('GPL3')
depends=('qt5-base' 'qtcreator' 'discord-rpc-api')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/QtcDRP/releases/download/v1.1.1/linux-release.tar.gz')
md5sums=('f4bf4e0c9d1cf40cd9c5a5a770ebd3e2')

package() {
	mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
	cp libQtCreatorDiscordRichPresence.so "$pkgdir/usr/lib/qtcreator/plugins"
}
