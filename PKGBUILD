# Maintainer: xpt <user.xpt@gmail.com>

pkgname=kodi-addon-quasar
pkgver=0.9.32
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

md5sums_arm=('73ce191de2b6d33071352fa21801fb8a')
md5sums_armv6h=('73ce191de2b6d33071352fa21801fb8a')
md5sums_armv7h=('a9ee51fb6f1cd67eef6ae82509497837')
md5sums_i686=('45a59bf1d5ae06ee3b69412214c99652') 
md5sums_x86_64=('cba047f97541d8f5988e376f63f571c7') 

install=kodi-addon-quasar.install

installpath=/var/lib/kodi/.kodi/addons/

package() {
  mkdir -p ${pkgdir}/${installpath}
  unzip -o ${classname}-${pkgver}.linux_x86.zip -d ${pkgdir}/${installpath}
  rm ${pkgdir}/${installpath}/${classname}/Makefile
}