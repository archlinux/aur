pkgname=seznam-cz
pkgver=dev_nwjs0.14.7_3.6.0_61968_1612161456
pkgrel=1
pkgdesc="Seznam.cz browser"
arch=('x86_64')
url="http://www.seznam.cz/prohlizec"
license=('custom')
depends=()
optdepends=()
options=('!emptydirs' '!strip')
source=("http://stardust.dev/debian/Seznam/all/Seznam.cz-${pkgver//_/-}-amd64.deb")
sha256sums=('2f94fce1121029afa886065c39138b24581663077d38335a3a52f2f183aeed66')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  install -D "$pkgdir/opt/Seznam.cz/Seznam.cz.desktop" "$pkgdir/usr/share/applications/Seznam.cz.desktop"
}
