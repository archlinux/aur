# Maintainer: username227 <gfrank227 [at] gmail [dot] com>

pkgname=cinnamon-6.2-theme
pkgver=1.1
pkgrel=2
pkgdesc="This theme preserves the default theme from Cinnamon 6.2 for the Cinnamon desktop"
arch=(x86_64)
url=https://github.com/username227/Cinnamon-6.2-theme
license=(GPL2.0)
depends=('cinnamon')
makedepends=('git')
source=("Cinnamon-6.2::git+${url}#tag=1.1")
sha256sums=('35bd731d53597507cfd17b1761cce35019b0aba906dfada4f9f47f3ed5caafa5')
package() {
install -dm644 $pkgdir/usr/share/themes/Cinnamon-6.2
cp -r $srcdir/Cinnamon-6.2/cinnamon-6.2 $pkgdir/usr/share/themes
}

