# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-eztv-mc
pkgver=3.0.4
pkgrel=1
pkgdesc='EZTV provider for pulsar'
classname=script.pulsar.eztv-mc
arch=('any')
url='https://github.com/mancuniancol/script.pulsar.eztv-mc'
license=('GPL3')
depends=('kodi' 'kodi-addon-pulsar')
options=(!strip)
source=("https://github.com//mancuniancol/script.pulsar.eztv-mc/archive/${pkgver}.tar.gz")
installpath=/var/lib/kodi/.kodi/addons/
install=provider.install

package() {
  mkdir -p ${pkgdir}/${installpath}
  cp -r ${srcdir}/${classname}-${pkgver} ${pkgdir}/${installpath}/${classname}
}

md5sums=('b4d5a346f6152531aac6c58656f3f6a9')
