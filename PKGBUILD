pkgname=seznam-cz
pkgver=stable_nwjs0.22.3_4.1.5
pkgrel=1
pkgdesc="Seznam.cz browser"
arch=('x86_64')
url="http://www.seznam.cz/prohlizec"
license=('custom')
depends=()
optdepends=()
options=('!emptydirs' '!strip')
source=("http://sbrowser.dev/debian/Seznam.cz-${pkgver//_/-}-amd64.deb")
sha256sums=('d43356828a80a2053345064274be978e97586994b5e27bd48a5eba86a2174375')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  install -D "$pkgdir/opt/Seznam.cz/Seznam.cz.desktop" "$pkgdir/usr/share/applications/Seznam.cz.desktop"
}
