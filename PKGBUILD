# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=1.3.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/terminix.zip)
sha512sums_x86_64=('845d07176672a73e5bed65223d78b06e00453d6881c7e56a8f2aee5a06ebc393ebf7f46f3c9f6657d5e55f0d0666fdb0d559c3bd0a86b4dbc9eaabe528b61838')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
