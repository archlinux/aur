# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-yify-mc
pkgver=3.0.2
pkgrel=1
pkgdesc='YiFy provider for pulsar'
classname=script.pulsar.yify-mc
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
	
md5sums=('eabb9c96cdc3e8d7213ce455ffabaa71')
