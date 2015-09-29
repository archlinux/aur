# Maintainer: Peter Hoeg <first name at last name dot com>
# Contributor: nosada <ngsksdt@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg==|base64 -d>

pkgname=caledonia-backgrounds
_pkgname=Caledonia_Official_Wallpaper_Collection
pkgver=2.0
pkgrel=3
pkgdesc="The official wallpaper collection for Caledonia (DE-independent)"
arch=('any')
url="http://malcer.deviantart.com"
license=('CCPL')
conflicts=('caledonia-bundle=2.0-2' 'caledonia-bundle-plasma5=2.0-4')
source=("http://sourceforge.net/projects/caledonia/files/Caledonia%20Official%20Wallpapers/Caledonia_Official_Wallpaper_Collection-${pkgver}.tar.gz")
sha256sums=('42caaeff55359bb5789f2c624595a4d67011024ec5201d40212f381b82535e29')

package() {
  cd ${srcdir}/${_pkgname}

  mkdir -p -m755 "${pkgdir}/usr/share/doc/caledonia-backgrounds"
  mv README "${pkgdir}/usr/share/doc/caledonia-backgrounds"

  mkdir -p -m755 "${pkgdir}/usr/share/wallpapers"
  cp -rf --no-preserve=mode * "$pkgdir/usr/share/wallpapers"
}

# vim:set ts=2 sw=2 et:
