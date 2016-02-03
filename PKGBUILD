# Maintainer: LinuxUser <webmaster@nordlogix.com>

pkgname=eboard-extras-pack1
pkgver=1pl2
pkgrel=1
pkgdesc="Extra sounds and piece sets for Eboard (pack 1)"
url="http://www.bergo.eng.br/eboard/"
arch=('any')
depends=('eboard')
license=('GPL')
_pkg=eboard-extras
_ver=1pl2
_pack="pack 1 patchlevel 2"
source=("${_pkg}-${_ver}.tar.gz::http://sourceforge.net/projects/eboard/files/${_pkg}/${_pack}/${_pkg}-${_ver}.tar.gz/download")
md5sums=('d5fb7a541d9ef5f6d1d565d877b1ab9a')

build() {
    true
}

package() {
    cd "${_pkg}-${_ver}"

    install -d $pkgdir/usr/share/eboard

    install -m644 *.wav $pkgdir/usr/share/eboard/
    install -m644 *.png $pkgdir/usr/share/eboard/
    install -m644 extras1.conf $pkgdir/usr/share/eboard/themeconf.extras1
}
