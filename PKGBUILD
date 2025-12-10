pkgname=simple-and-soft-cursor
pkgver=1.0
pkgrel=1
pkgdesc='A simple and soft X cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.gz::https://github.com/red-magic/cursor-themes/releases/download/1.0/$pkgname.tar.gz)
b2sums=(2fdee07ec229d8a8bf4d5971f99a8761b9c1d73fb9a57bdbbfcfe9c6d5c67dc0d1c4000d0d996df3929ad4a826278511b28dc0b7a8dadec91238dd491489a651)

package() {
	install -Dm 644 $pkgname/cursors/* -t $pkgdir/usr/share/icons/$pkgname/cursors
	install -Dm 644 $pkgname/index.theme -t $pkgdir/usr/share/icons/$pkgname
}
