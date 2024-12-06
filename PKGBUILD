# Maintainer: username227 <gfrank227 [at] gmail [dot] com>

pkgname=cinnamon-6.2-theme
pkgver=1.0
pkgrel=1
pkgdesc="This theme preserves the default theme from Cinnamon 6.2 for the Cinnamon desktop"
arch=(x86_64)
url=https://github.com/username227/Cinnamon-6.2-theme
license=(GPL2.0)
depends=('cinnamon')
makedepends=('git')
source=("Cinnamon-6.2::git+$url")
sha256sums=('SKIP')
package() {
install -dm644 $pkgdir/usr/share/themes/Cinnamon-6.2
cp -r $srcdir/Cinnamon-6.2/cinnamon-6.2 $pkgdir/usr/share/themes
}

