# Maintainer: goetzc
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=1.0
pkgrel=1
pkgdesc="Breeze cursor theme (KDE Plasma 5)"
arch=('any')
url="http://gnome-look.org/content/show.php/Breeze+Serie?content=169316"
license=('GPL')
depends=('libxcursor')
makedepends=('unzip')
source=("Breeze-Default-${pkgver}.tgz::https://copy.com/FzUgqqvKfo3mLpeB/Breeze-Default.tgz?download=1")
md5sums=('5563f9d94c1896d606db260f0e809f76')

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/Breeze-Default/ "$pkgdir"/usr/share/icons/Breeze-Default
}
