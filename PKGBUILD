# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar-icanuck
pkgver=2.0.0
pkgrel=1
pkgdesc='Pulsar Providers specially crafted addons to function with the Pulsar Video Addon'
classname=repository.icanuck
arch=('any')
url='http://sourceforge.net/projects/icanuckkodirepo/'
license=('GPL3')
depends=('kodi' 'kodi-addon-pulsar')
source=("http://downloads.sourceforge.net/project/icanuckkodirepo/${classname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('46564a802c27aef8d72cd2ef57b53a33')
md5sums=('daa559b57d944a90e294326401d8afba')
