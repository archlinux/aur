# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.50.0
pkgrel=2
pkgdesc="A tiling terminal emulator based on GTK+ 3"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
install=terminix.install
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('84b2c35025301379185ead4b319cb160454252c4f541415c44b2b2a4899e773f5f950669a7eb4f8a288adc853d2bcade8980db3e8f69e5eeb5416c06ccf2a839')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
