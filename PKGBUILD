pkgname=archivo-narrow
pkgver=1.0
pkgrel=1
pkgdesc="Archivo Narrow Font"
arch=(any)
url=https://fontlibrary.org/en/font/archivo-narrow
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("https://fontlibrary.org/assets/downloads/archivo-narrow/670092d441e4e200e60b24ea7c7198c0/archivo-narrow.zip")
install=$pkgname.install
md5sums=('670092d441e4e200e60b24ea7c7198c0')

package(){
	cd "$srcdir/ArchivoNarrow-for-Print/"
	install -m 644 -D "ArchivoNarrow-Bold.otf" "$pkgdir/usr/share/fonts/archivo-narrow/archivo-narrow-bold.otf"
	install -m 644 -D "ArchivoNarrow-BoldItalic.otf" "$pkgdir/usr/share/fonts/archivo-narrow/archivo-narrow-bold-italic.otf"
	install -m 644 -D "ArchivoNarrow-Italic.otf" "$pkgdir/usr/share/fonts/archivo-narrow/archivo-narrow-italic.otf"
	install -m 644 -D "ArchivoNarrow-Regular.otf" "$pkgdir/usr/share/fonts/archivo-narrow/archivo-narrow.otf"
}
