# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='7.3.67'
pkgrel='1'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('2f75c092d0b4a9ca21e454208658a87c42576ab258a9ffa872f46ab63d748f67280d6419dd63cd7b7d9a4d4a08e86407d67145685314bc77f7832a5ea72dd26a')

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}
