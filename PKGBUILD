
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=qtcdrp
pkgver=1.0
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/QtcDRP"
license=('GPL3')
depends=('qt5-base' 'qtcreator' 'discord-rpc-api')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/QtcDRP/releases/download/v1.0/linux-release.tar.gz')
md5sums=('111b2d865dcfca22f3239cdf7bd11edb')

package() {
	mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
	cp libQtCreatorDiscordRichPresence.so "$pkgdir/usr/lib/qtcreator/plugins"
}
