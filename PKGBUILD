# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-kickass-mc
pkgver=3.0
pkgrel=1
pkgdesc='KickAss provider for pulsar'
classname=script.pulsar.kickass-mc
arch=('any')
url='https://github.com/mancuniancol/'
license=('GPL3')
depends=('kodi' 'kodi-addon-pulsar')
options=(!strip)
source=("https://github.com//mancuniancol/${classname}/archive/${pkgver}.tar.gz")
installpath=/var/lib/kodi/.kodi/addons/
install=provider.install

package() {
  mkdir -p ${pkgdir}/${installpath}
  cp -r ${srcdir}/${classname}-${pkgver} ${pkgdir}/${installpath}/${classname}
}

md5sums=('8a43354f6fb57578ab14c9fff934d10e')
