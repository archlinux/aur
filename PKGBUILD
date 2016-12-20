# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20161117
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
#_HDTC_2US=${pkgver}
_HDTC_2US=20161119
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
md5sums=('b6f2179ea3887168da68e9bc443e91c6'
         '7e0adfcd2760e67ecd3b8946367d55bf'
         'a55631340681068557bf94641bcf0a5d'
         'd3d4c38fa96fb4f3c5f31664ec50cdee'
         'e82a94ce2bbc372c42f93008bc0b1f31'
         'f9553a4df622cf71cc5e50718c4a5614'
         '8916c90379c121f917b40e90dc34308e'
         '1335cb087f8ecf3bd990d76544d4834f'
         '245619758427fd198b625deb9026047b'
         '612e5f4f3668f7db02ee1bd4a1affc30')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
