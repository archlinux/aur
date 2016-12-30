# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=1.4.2
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'libx11')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/terminix.zip)
sha512sums_x86_64=('dbd9f2c26c75e1c1eb27798a50aaf1e898eb99f4751776eb6df541abe9e3c9c64604bebe65511851bdeebfbb75b43a4b54429a043539087cf66364fbc644fb32')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
