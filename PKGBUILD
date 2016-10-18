# Maintainer: Greg Greenaae <ggreenaae@gmail.com>
pkgname=beersmith2
pkgver=2.3.7
pkgrel=2
pkgdesc="BeerSmith features graphical recipe design, over a dozen standalone brewing tools, a beer style guide, inventory management, calendar and integrated shopping list."
arch=(x86_64)
url="http://www.beersmith.com"
license=('unknown')
depends=(libpng12 webkitgtk2)
source_x86_64=("http://s3.amazonaws.com/beersmith2-3/BeerSmith-2.3.7_amd64.deb")
md5sums_x86_64=('54cd8e9fb80d88e68e4ea56b9e7725b2')

package() {
  msg2 "Extracting the data.tar.gz..."
  tar -xvJf data.tar.xz -C "$pkgdir/"

  msg2 "Removing unnecessities (e.g. etc)..."
  rm -r "$pkgdir"/etc
}
