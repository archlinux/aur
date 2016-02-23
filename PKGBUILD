# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.50.2
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
install=terminix.install
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('069c05bdb1cf16eddaa8735487ef99b9f0fd3fe4dac9a1b50de50c4968a733ae2738a44b81ea32adc44c1e8ab6fa4324a3cd01e971302c50bd986d553f6e4d5c')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
