pkgname=goldfish-fox
pkgver=20170908
pkgrel=1
pkgdesc="Script to start Firefox with temporary empty profile"
arch=(any)
depends=(firefox)
source=(goldfish-fox goldfish-fox.desktop)
sha512sums=('d460a51dbaec7f66fb207fc5307f41967f29c054193904b5c87acf78d99af04c42653d420ebb3837073146ecdeef2dd5b9aba7418d796450485710cf0a07f30d'
			'b43117f43c437a737ba6a78afb2eec772ecca3d0b3190ba15b6054cd2240c82683c7fcbe48cc596658af8e913b8fed89fd0f3526f36ec2a2c5a1a38104aaa1d8')

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}