# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-magnetdl
pkgver=3.0
pkgrel=1
pkgdesc='Magnet provider for pulsar'
classname=script.pulsar.magnetdl-mc
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

md5sums=('f4cbf27aae53337d86233461fb535b8b')
