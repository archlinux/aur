# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20170930
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
_HDHR4_2IS=${pkgver}
_HDHR5_2US_4US=${pkgver}
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
        "http://download.silicondust.com/hdhomerun/hdhomerun4_isdbt_firmware_${_HDHR4_2IS}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_atsc_firmware_${_HDHR5_2US_4US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_${_HDTC_2US}.bin")
sha256sums=('5b0a2324536fe1149c5d1f3cbc27c2e8bb90840114ea55764c97053543d94bd5'
            '01a3d077a897abde1ee5a798474ae92adcd5b2ef7786c26d78e89673a72c385f'
            'c9b1fda0b7765883b718298a7302b9c527559ceb97315e22087dfeeaa16625ef'
            '46167b04e5f7d94c0f16d17cf37c10be6ddb4f7f45b5b061b7943592038e021b'
            '732a808ad9997994db7c72344f1731099bdd85b29c8709235bb50b0b2188fe54'
            'a1744a73fa6ccbffc67bb20774259fdf81727a145d5c60877e4ec0a4cff29bce'
            'b213b05c7caee7f6042746791cfc4cb944cd1b1adaaa9b67ded60a7c2b457cce'
            '454d7fb68b45e240243970b2d1c3b472aaf983aafef716ac663d6ebcea589aa4'
            '840d73487af39d0ce079b2efaf8c62dbc116ba38407e98a94fcb98bc4388a0f1'
            '18a45bd72fe4e19a8ae537061935072ff8fd4c99df5ca220ff53acf3fca8b0dd'
            '7684cc07cfdcdaa5e5df246e91e1496eb79876a849443e67cddf14aeeb3d85a0'
            '9f7ff5216e459783b5df9045d3a075335e09683ab2bfb3c8b1b087d069cc9f0c')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
