# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=1.2.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (binary distribution)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
source_x86_64=(${pkgname}-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/${pkgver}/terminix.zip)
sha512sums_x86_64=('1252d97395d7b6ceaec224149771fbd5c0d7799559563cd29b57ec1fcded3f12c59c0d1b80ecb69726c59124dc70da7eaec7931de0f9568ab8a581e358db08b6')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
