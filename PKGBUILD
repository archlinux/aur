# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg==|base64 -d>

pkgname=caledonia-backgrounds
_pkgname=Caledonia_Official_Wallpaper_Collection
pkgver=2.0
pkgrel=1
pkgdesc="The official wallpaper collection for Caledonia (DE-independent)"
arch=('any')
url="http://malcer.deviantart.com"
license=('CCPL')
source=("http://sourceforge.net/projects/caledonia/files/Caledonia%20Official%20Wallpapers/Caledonia_Official_Wallpaper_Collection-${pkgver}.tar.gz")
sha256sums=('9488e00637af5ac10eddcea37063ac63d1b33010fbb5d4dae0060954001da917')

package() {
  cd ${srcdir}/${_pkgname}
  mkdir -p -m755 "${pkgdir}/usr/share/wallpapers/caledonia"
  rm README
  cp -rf --no-preserve=mode * "$pkgdir/usr/share/wallpapers/caledonia"
}
sha256sums=('42caaeff55359bb5789f2c624595a4d67011024ec5201d40212f381b82535e29')

# vim:set ts=2 sw=2 et:
