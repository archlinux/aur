# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-provider-manager
pkgver=3.0
pkgrel=1
pkgdesc='Provider manager for pulsar'
classname=script.provider.manager
arch=('any')
url='https://github.com/mancuniancol/script.pulsar.eztv-mc'
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

md5sums=('c2959c2568e8e0d7c5da63f1f1788669')
