# Maintainer: LinuxUser <webmaster@nordlogix.com>

pkgname=eboard-extras-pack2
pkgver=2
pkgrel=1
pkgdesc="Extra sounds and piece sets for Eboard (pack 2)"
url="http://www.bergo.eng.br/eboard/"
arch=('any')
depends=('eboard')
license=('GPL')
_pkg=eboard-extras
_ver=2
_pack="pack 2"
source=("${_pkg}-${_ver}.tar.gz::http://sourceforge.net/projects/eboard/files/${_pkg}/${_pack}/${_pkg}-${_ver}.tar.gz/download")
md5sums=('e0994803fdd2b3c6b2367efeaa841a34')

build() {
    true
}

package() {
    cd "${_pkg}-${_ver}"

    install -d $pkgdir/usr/share/eboard

    install -m644 *.wav $pkgdir/usr/share/eboard/
    install -m644 *.png $pkgdir/usr/share/eboard/
    install -m644 extras2.conf $pkgdir/usr/share/eboard/themeconf.extras2
}
