# Maintainer: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Wesley Merkel <ooesili@gmail.com>

pkgname=slim-archlinux-solarized-spiral
pkgver=0.3
pkgrel=2
pkgdesc="Solarized Spiral theme for SLiM using the Arch Linux logo"
arch=('any')
url="http://opendesktop.org/content/show.php?content=163969"
license=('GPL')
optdepends=('slim: login manager providing theme support')
source=("http://opendesktop.org/CONTENT/content-files/163969-slim-archlinux-solarized-spiral.zip")
sha512sums=('e80e66dff55ac6fe43b4423e7240244fdc299ca3c6eadb34f803a2e329ee90c04ab567b4be181859f79c6787b7edabcd85552cb93cf3ea711eaa827933daa171')

package() {
    cd $srcdir/$pkgname
    mkdir -p $pkgdir/usr/share/slim/themes
    cp -a solarized-spiral-* $pkgdir/usr/share/slim/themes
}
