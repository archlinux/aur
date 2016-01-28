# Maintainer: Gerald Nunn <gerald dot b dot nunn at gmail dot com>

pkgname=terminix
pkgver=0.45.0
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('libnautilus-extension: for "open with terminix" support in nautilus')
install=terminix.install
source_x86_64=(https://github.com/gnunn1/terminix/releases/download/$pkgver/terminix.zip)
sha256sums_x86_64=('3b2b9d6d7c17b953ae8e4ce8d0516197688703af287aef26298df9d0bb0edf69')

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}
