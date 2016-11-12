# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20161107
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
_HDHR3_CC=${pkgver}b
_HDHR3_4DC=${pkgver}b
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
md5sums=('f6c5d2e334027102a3d918a8491586ed'
         '3a0c901ef32367d8ea15b2b9197a69be'
         '8a5404220f9ba0c7c27a822bfe1e3fbf'
         '4339cf651b7a65f423c99741b0575105'
         '7bbd1944281a63e6f192089c3f15081c'
         'bade9a3c2e3cb90aeaaa164230fb38d0'
         '9c1cbd945e40b401914bee47cf90233d'
         '7cfba9521ffea749f3d1dc12423146c5'
         'a0d60dd5e84e1b6dacdce901195f9344'
         '183fcde43bb53a2fae238276de030047')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
