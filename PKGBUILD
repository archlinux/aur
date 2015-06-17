# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-eztv-platbr
pkgver=0.0.9b
pkgrel=1
pkgdesc='Pulsar is an torrent finding and streaming engine for Kodi'
classname=script.pulsar.eztv-platbr
arch=('any')
url='https://github.com/platbr/'
license=('GPL3')
depends=('kodi')
options=(!strip)
source=("https://github.com//platbr/${classname}/archive/${pkgver}.tar.gz")
installpath=usr/share/kodi/addons/

package() {
  mkdir -p ${pkgdir}/${installpath}
  cp -r ${srcdir}/${classname}-${pkgver} ${pkgdir}/${installpath}/${classname}
}



md5sums=('d22e1f9e0894de34707bacec6babceb8')
