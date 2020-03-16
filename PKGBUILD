pkgname=rsngm-chat
pkgver=666
pkgrel=666
pkgdesc="Чат на питоне"
arch=('any')
license=("CUSTOM")
url="https://github.com/rasongame/chat"
source=("https://github.com/rasongame/chat/archive/master.zip")
sha256sums=('SKIP')
depends=('python')
package(){
	cd $srcdir/chat-master
	install -Dm777 client.py $pkgdir/usr/bin/rsngm-chat
	install -Dm777 server.py $pkgdir/usr/bin/rsngm-chat-server

}

