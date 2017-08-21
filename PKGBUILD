# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20170815
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=${pkgver}
_HDHR_EU=${pkgver}
_HDHR3_US=${pkgver}
_HDHR3_DT=${pkgver}
_HDHR3_EU=${pkgver}
_HDHR3_CC=${pkgver}
_HDHR3_4DC=${pkgver}
_HDHR4_2US=${pkgver}
_HDHR4_2DT=${pkgver}
_HDTC_2US=${pkgver}
source=("http://download.silicondust.com/hdhomerun/hdhomerun_atsc_firmware_${_HDHR_US}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun_dvbt_firmware_${_HDHR_EU}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_atsc_firmware_${_HDHR3_US}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbt_firmware_${_HDHR3_DT}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbtc_firmware_${_HDHR3_EU}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_cablecard_firmware_${_HDHR3_CC}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbc_firmware_${_HDHR3_4DC}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun4_atsc_firmware_${_HDHR4_2US}.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun4_dvbt_firmware_${_HDHR4_2DT}.bin"
"http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_${_HDTC_2US}.bin")
md5sums=('550b6e37fb122725df89675bd2e1c898'
         'c27db0825599aefcb709c2b04cab084d'
         '3514965087a7f5f3951647e51c1519cd'
         '3d43ae760bb1812d1d8826720ac541d5'
         '18e045ec151da231d53054773ce74b5c'
         '5d66e0446a942c272fdae73a97557542'
         '8a2b6e7ce1f3d3ab664494742c56d2dc'
         '9f61b3ceeae27d20ff0d215a89478647'
         '7c5263dd61de2fac192f13eca6738de3'
         '4926e4d890899ecfb657ce60071bc751')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
