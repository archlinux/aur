pkgname=seznam-cz
pkgver=alpha_nwjs0.14.7_3.6.0_56299_1612121544
pkgrel=2
pkgdesc="Seznam.cz browser"
arch=('x86_64')
url="http://www.seznam.cz/prohlizec"
license=('custom')
depends=()
optdepends=()
options=('!emptydirs' '!strip')
source=("http://stardust.dev/debian/Seznam/all/Seznam.cz-${pkgver//_/-}-amd64.deb")
sha256sums=('6911e2daeac6fc5d1b02a673d04b897538102d17f36fdbfdb3d7636a3fdc035a')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  install -D "$pkgdir/opt/Seznam.cz/Seznam.cz.desktop" "$pkgdir/usr/share/applications/Seznam.cz.desktop"
}
