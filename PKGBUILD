# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20180327
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
legacyver=20170930
_HDHR_US=${legacyver}
_HDHR_EU=${legacyver}
_HDHR3_US=${legacyver}
_HDHR3_DT=${legacyver}
_HDHR3_EU=${legacyver}
_HDHR3_CC=${legacyver}
_HDHR3_4DC=${legacyver}
_HDHR4_2US=${pkgver}
_HDHR4_2DT=${pkgver}
_HDHR4_2IS=${pkgver}
_HDHR5_2US_4US=${pkgver}
_HDTC_2US=${pkgver}
_HDHR5_2DT_4DT=${pkgver}

source=("http://download.silicondust.com/hdhomerun/hdhomerun_atsc_firmware_${_HDHR_US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_dvbt_firmware_${_HDHR_EU}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_atsc_firmware_${_HDHR3_US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_dvbt_firmware_${_HDHR3_DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_dvbtc_firmware_${_HDHR3_EU}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_cablecard_firmware_${_HDHR3_CC}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_dvbc_firmware_${_HDHR3_4DC}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun4_atsc_firmware_${_HDHR4_2US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun4_dvbt_firmware_${_HDHR4_2DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun4_isdbt_firmware_${_HDHR4_2IS}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_atsc_firmware_${_HDHR5_2US_4US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_dvbt_firmware_${_HDHR5_2DT_4DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_${_HDTC_2US}.bin")
sha256sums=('5b0a2324536fe1149c5d1f3cbc27c2e8bb90840114ea55764c97053543d94bd5'
            '01a3d077a897abde1ee5a798474ae92adcd5b2ef7786c26d78e89673a72c385f'
            'c9b1fda0b7765883b718298a7302b9c527559ceb97315e22087dfeeaa16625ef'
            '46167b04e5f7d94c0f16d17cf37c10be6ddb4f7f45b5b061b7943592038e021b'
            '732a808ad9997994db7c72344f1731099bdd85b29c8709235bb50b0b2188fe54'
            'a1744a73fa6ccbffc67bb20774259fdf81727a145d5c60877e4ec0a4cff29bce'
            'b213b05c7caee7f6042746791cfc4cb944cd1b1adaaa9b67ded60a7c2b457cce'
            'a3d5b9554a568b0eefedeaf13b3c5256c6a1c83e057750c60c43dafe63cb9b71'
            'cdc134bc1eb21e32ed3b1cb9765a965743f5b8296368be1b61f4fff74402d32f'
            '90b5f86b989e0877446a8019cb06f426a94b21c724766325c0675b84433aed3c'
            '3cb04de815c2b64ea9b60baaf531e2ba8b44025a0101d256793331b114a7da50'
            '152b7457e643c41d49b6faeb919efe077672821ec96cc1fb6be0a37b342980d2'
            '3ef820ad9e549499205147233e8c4c93fb292d7904ed2c0eafa40661063fad8a')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
