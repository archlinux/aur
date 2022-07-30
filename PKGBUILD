# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=kwin-tiling
pkgver=2.4.0
pkgrel=1
pkgdesc="Tiling script for kwin, based on Mathias Gottschlag’s version"
arch=('any')
url="https://github.com/kwin-scripts/kde-tiling"
license=('MIT')
provides=("$pkgname")
source=("https://github.com/kwin-scripts/kwin-tiling/archive/refs/tags/v2.4.tar.gz")
md5sums=("SKIP")
depends=('plasma-framework')

package() {
  cd $srcdir/kwin-tiling-2.4
  plasmapkg2 --type kwinscript -i .
}
