# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-yify-platbr
pkgver=0.0.4b
pkgrel=1
pkgdesc='Pulsar is an torrent finding and streaming engine for Kodi'
classname=script.pulsar.yify-platbr
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

md5sums=('9e36bb0f113fae6e427f029f0c69d29f')
