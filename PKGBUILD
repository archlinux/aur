# maintainer: kalter@deadsoftware.ru

pkgname=terminus-re33
pkgver=1.0
pkgrel=1
pkgdesc="ttf version of terminus-font"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("http://deadsoftware.ru/files/${pkgname}.ttf.gz")
sha256sums=('ccf315c5ffeac3efee3fbc9e066595a05e4f79aa0742831598a4ab7c28641d25')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
