# Maintainer: Greg Greenaae <ggreenaae@gmail.com>
pkgname=beersmith2
pkgver=2.2.12
pkgrel=1
pkgdesc="BeerSmith2 features graphical recipe design, over a dozen 
standalone brewing tools, a beer style guide, inventory management, calendar and integrated shopping list."
arch=(x86_64)
url="http://www.beersmith.com"
license=('unknown')
depends=(libpng12 webkitgtk2)
source=("https://s3.amazonaws.com/BeerSmith2-2/BeerSmith-2.2.12_amd64.deb")
md5sums=('f23b2a4d64bed4e6edb2c9d33f605a85')

package() {
  msg2 "Extracting the data.tar.gz..."
  tar -zxvf data.tar.gz -C "$pkgdir/"

  msg2 "Removing unnecessities (e.g. etc)..."
  rm -r "$pkgdir"/etc
}
