# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.60.1
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('b5ed62db4cdb275216bcbccaeba8f50448b21438cfc08960331646974c49773450bf8ab4ebd8eb4383f768b8357a1aaec2e6ca106fb1f3eb7a443a84d7c7137a')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
