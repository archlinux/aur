# Maintainer: Alejandro Villanueva <awewanwo at disroot dot org>
pkgname=(otf-d-din ttf-d-din)
pkgbase=d-din
_fontname="d-din"
pkgver=1.1
pkgrel=1
epoch=
pkgdesc='Package for the D-DIN font family'
arch=('any') # Fonts are arch-independent
url="https://fontlibrary.org/en/font/d-din"
license=('custom:OFL')
depends=()
makedepends=('unzip') # Not really sure if this is inside base or base-devel
source=("https://fontlibrary.org/assets/downloads/${_fontname}/39fc8c3de156292478f87c2ff0b96df2/${_fontname}.zip")
#noextract=("$pkgname.zip")
noextract=()
md5sums=('39fc8c3de156292478f87c2ff0b96df2')
validpgpkeys=()

package_otf-d-din() {
	pkgdesc+=' OTF'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL-1.1.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/${_fontname}-otf" *.otf
}

package_ttf-d-din() {
	pkgdesc+=' TTF'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL-1.1.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/${_fontname}-ttf" *.ttf
}
