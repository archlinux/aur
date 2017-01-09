# Maintainer: siers <wimuan@gmail.com>
# vim: ts=2 sw=2
pkgname=latvijas-radio
pkgver=20170109
pkgrel=1
pkgdesc="A very simple interface for to listening to Latvian radio."
url="http://www.latvijasradio.lsm.lv/lv/lr/"
license=('MIT')
arch=('any')
makedepends=()
depends=('ruby' 'mpv')
optdepends=()
source=(latvijas-radio)
sha256sums=('e549c2b427aa8846163d174407c1db987fb4e464cefea956b3e091bbdd1e00ca')

package() {
  install -Dm755 "latvijas-radio" "$pkgdir/usr/bin/latvijas-radio"
}
