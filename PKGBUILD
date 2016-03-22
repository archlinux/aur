# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.33
pkgrel=1
pkgdesc='Quasar is an torrent finding and streaming engine for Kodi (fork of Pulsar add-on)'
classname=plugin.video.quasar
arch=('any')
url='https://https://github.com/scakemyer/plugin.video.quasar'
license=('GPL3')
depends=('kodi' 'kodi-standalone-service')
depends_arm=('kodi-rbp')
depends_armv6h=('kodi-rbp')
depends_armv7h=('kodi-rbp')
options=(!strip)
noextract=(${classname}-${pkgver}.zip)

source_arm=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_arm.zip")
source_armv6h=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_arm.zip")
source_armv7h=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_armv7.zip")
source_i686=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_x64.zip")
source_x86_64=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_x86.zip")

md5sums_arm=('e2ef50ef1f271fd079cf7d1a117df5ba')
md5sums_armv6h=('e2ef50ef1f271fd079cf7d1a117df5ba6h')
md5sums_armv7h=('e2ef50ef1f271fd079cf7d1a117df5ba7h')
md5sums_i686=('3304a6a44cf58743850b1fc29bc1e52b')
md5sums_x86_64=('47196cc5dbbb6526b4dff1ee85e337cf')

install=kodi-addon-quasar.install

installpath=/var/lib/kodi/.kodi/addons/

package() {
  mkdir -p ${pkgdir}/${installpath}
  unzip -o ${classname}-${pkgver}.linux_x86.zip -d ${pkgdir}/${installpath}
  rm ${pkgdir}/${installpath}/${classname}/Makefile
}