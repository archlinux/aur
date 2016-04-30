# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.59.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('f89d3d5fdc7cc1d6bab09b1dcecc8e2be10d1218616a3d29ab105fef794cff1946a29a0a96596659328a5613058b56036f8b831e4384165c7123b5822f4611d4')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
