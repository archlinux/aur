# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.56.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
install=terminix.install
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('7af35d16536c458b28bca196a14914cdf9b60dbf7227757d762b4335d99ee4ad331a8c708a75e36200ce82ad32b77f6ca105449332251a8656d38d3585e67fed')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
