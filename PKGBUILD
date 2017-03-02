# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=1.5.2
pkgrel=2
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('liblphobos' 'gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/terminix.zip)
md5sums_x86_64=('edf55dd0d85e46d5ad79126c879b4529')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
