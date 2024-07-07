# Maintainer: kakakaya < kakakaya+git AT gmail DOT com >
pkgname=mazesoba-continent-bin
pkgver=17
pkgrel=1
pkgdesc=' A Bluesky client with minimum window and miscellaneous toppings.'
arch=('x86_64')
url='https://github.com/kakakaya/mazesoba-continent'
license=('MIT') 
options=('!strip')

source=(
  "mazesoba-continent::https://github.com/kakakaya/mazesoba-continent/releases/download/v${pkgver}/mazesoba-continent"
)

b2sums=('377f95b39ee7cc73b643f7442834147f2909cf45546285aa394d02207933f8806b982fb167cac2ef6d7fc38a1bcbedddba79c54d57e8ae69bcb5186dc8593757')
package() {
  install -Dm755 "$srcdir/mazesoba-continent" "$pkgdir/usr/bin/mazesoba-continent"
  rm ${srcdir}/mazesoba-continent
}
