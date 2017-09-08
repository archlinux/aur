pkgname=goldfish-fox
pkgver=20170909
pkgrel=1
pkgdesc="Script to start Firefox with temporary empty profile"
arch=(any)
depends=(firefox)
source=(goldfish-fox goldfish-fox.desktop)
sha512sums=('544615ca463859f0e8b99c8d77d0bf9cb8c9ee3d31a8135523a3484273e63d3b0e368ff88bf41ac16aae4c526e90f6412b57f14dbc5e4203ead9e9a22585dd32'
			'b43117f43c437a737ba6a78afb2eec772ecca3d0b3190ba15b6054cd2240c82683c7fcbe48cc596658af8e913b8fed89fd0f3526f36ec2a2c5a1a38104aaa1d8')

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}