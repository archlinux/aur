# Author: Boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

pkgname=bashbullet
pkgver=`date +%Y%m%d`
pkgrel=1
pkgdesc="A pushbullet systray notification daemon for linux. also a simple client to receive, mirror, and send pushes."
arch=('any')
url="https://github.com/Boteium/bashbullet"
license=('GPL')
depends=(jshon nodejs libnotify 'yad>=0.31' nodejs-ws xclip)
optdepends=( 	'screen: running in background'
		'surl: url shortener support'
		'nodejs-atob: nodejs module for encryption support'
		'nodejs-btoa: nodejs module for encryption support'
		'nodejs-node-forge: nodejs module for encryption support'
)
source=('git://github.com/Boteium/bashbullet.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/bashbullet"

	install -Dm 755 "bashbullet" "$pkgdir/usr/bin/bashbullet"
	install -Dm 755 "dec.js" "$pkgdir/usr/share/bashbullet/dec.js"
	install -Dm 755 "keygen.js" "$pkgdir/usr/share/bashbullet/keygen.js"
	install -Dm 655 "config_example" "$pkgdir/usr/share/bashbullet/config_example"
	install -Dm 655 "pushbullet.svg" "$pkgdir/usr/share/bashbullet/pushbullet.svg"
	install -Dm 655 "README.md" "$pkgdir/usr/share/doc/bashbullet/README.txt"
}
