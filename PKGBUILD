# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.52.1
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
install=terminix.install
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('b77530f229f0b5cb1f8feda2f8ab791d18b8e47f35dc13c580c8aa815f72dbbe3b71d635070e8658daa379f9e8fd7c5709d4446cca19840725000f42bd9161c9')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
