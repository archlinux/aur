# Maintainer: lu40 <lucaobertuefer at mailbox dot org>
pkgname=ttf-sf_groove_machine
pkgver=1.0
pkgrel=1
pkgdesc="SF Groove Machine Truetype Font by ShyFonts"
arch=('any')
url="http://www.dafont.com/sf_groove_machine.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-sf_groove_machine.install
source=('http://img.dafont.com/dl/?f=sf_groove_machine')
noextract=('?f=sf_groove_machine')
md5sums=('c749382398365f7ff0cd0d426f645921')

prepare() {
	cd "$srcdir"
	mv "?f=sf_groove_machine" "sf_groove_machine.zip"
	unzip sf_groove_machine.zip
}

package() {
	cd "$srcdir"
	install -Dm0644 SF\ Groove\ Machine.ttf $pkgdir/usr/share/fonts/TTF/SF\ Groove\ Machine.ttf
}
