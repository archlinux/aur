# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.50.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
install=terminix.install
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha512sums_x86_64=('3b2bd375623df93d84254a090caaaa250912a4358b5ccb66dec6e53803c1eb0a21905aa8ae17714c537763d6f34e6ebeeb67f7af1cb06506209e54dd1975711e')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
