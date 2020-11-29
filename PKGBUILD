# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=mpd-art-box
pkgname='mpd-art-box'
pkgver=0.0.4
_srcname="${pkgname}-${pkgver}"
pkgrel=2
pkgdesc="A window displaying the cover for the currently playing MPD track - nothing more"
arch=('any')
url="https://github.com/nvllsvm/mpd-art-box"
license=('MIT')
depends=(
    'python-configargparse' 
    'python-gobject' 
    'python-mpd2'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${_srcname}.tar.gz")
sha256sums=('00a8a49e9b3cc63a8b1b7827b2d8a8b2ed90162ba7f96688c016b4c391ffa27b')

package() {
  cd "${srcdir}"/"${_srcname}"
  install -D -m 755 mpd_art_box.py "$pkgdir"/usr/bin/mpd-art-box
}
