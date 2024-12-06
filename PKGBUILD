# Maintainer: username227 <gfrank227 [at] gmail [dot] com>

pkgname=cinnamon-6.2-theme
pkgver=1.0
pkgrel=2
pkgdesc="This theme preserves the default theme from Cinnamon 6.2 for the Cinnamon desktop"
arch=(x86_64)
url=https://github.com/username227/Cinnamon-6.2-theme
license=(GPL2.0)
depends=('cinnamon')
makedepends=('git')
source=("Cinnamon-6.2::git+${url}#tag=1.0")
sha256sums=('6ed17b1d36d837b8121eda63f5d7e48b3fc0e63ce9c7e5e065dc4205ef47f5a6')
package() {
install -dm644 $pkgdir/usr/share/themes/Cinnamon-6.2
cp -r $srcdir/Cinnamon-6.2/cinnamon-6.2 $pkgdir/usr/share/themes
}

