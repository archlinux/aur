# Author: Boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

pkgname=bashbullet
pkgver=20150822
pkgrel=1
pkgdesc="A pushbullet systray notification daemon for linux. also a simple client to receive and to send pushes."
arch=('any')
url="https://github.com/Boteium/bashbullet"
license=('GPL')
depends=(jshon nodejs libnotify yad nodejs-ws)
optdepends=( 'surl: url shortener support' )
source=('git://github.com/Boteium/bashbullet.git')
md5sums=('SKIP')

package() {
	pkgver=`date +%Y%m%d`
	cd "$srcdir/bashbullet"

	install -Dm 755 "bashbullet" "$pkgdir/usr/bin/bashbullet"
	install -Dm 655 "config_example" "$pkgdir/usr/share/bashbullet/config_example"
	install -Dm 655 "pushbullet.svg" "$pkgdir/usr/share/bashbullet/pushbullet.svg"
	install -Dm 655 "README.md" "$pkgdir/usr/share/doc/bashbullet/README.txt"
}
