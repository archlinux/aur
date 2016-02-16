# Contributor: Gerald Nunn <gerald dot b dot nunn at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix
pkgver=0.46.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('libnautilus-extension: for "open with terminix" support in nautilus')
install=terminix.install
source_x86_64=(teminix-${pkgver}.zip::https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha256sums_x86_64=('f333497e364353e99c563160c91f9902f18ca5cfbcc64cc59034f37d8773b24e')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
