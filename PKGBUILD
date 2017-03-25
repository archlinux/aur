# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger at gmail dot com>
# Maintainer: Hannes Eichblatt <aur at hanneseichblatt dot de>

pkgname=terminix
pkgver=1.5.4
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('liblphobos' 'gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/tilix.zip)
md5sums_x86_64=('20d2969d686408051330e9645e70987b')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
