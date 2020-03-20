# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20200225
legacyver=20200225
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=${legacyver}
_HDHR_EU=${legacyver}
_HDHR3_US=${legacyver}
_HDHR3_DT=${legacyver}
_HDHR3_EU=${legacyver}
_HDHR3_CC=${pkgver}
_HDHR3_4DC=${pkgver}
_HDHR4_2US=${pkgver}
_HDHR4_2DT=${pkgver}
_HDHR4_2IS=${pkgver}
_HDTC_2US=${pkgver}
_HDHR5_2US_4US=${pkgver}
_HDHR5_4DC=${pkgver}
_HDHR5_2DT_4DT=${pkgver}
_HDVR_2US_4US_1TB=${pkgver}
_HHDD_2TB=${pkgver}

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
        "http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_${_HDTC_2US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_atsc_firmware_${_HDHR5_2US_4US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_dvbc_firmware_${_HDHR5_4DC}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_dvbt_firmware_${_HDHR5_2DT_4DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_dvr_atsc_firmware_${_HDVR_2US_4US_1TB}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_hdd_firmware_${_HHDD_2TB}.bin")
sha256sums=('8827973f66b4bfed3cff689a87fd978891c1845fe3609578db5c3cc39bd0471f'
            '1cfbe01431d521911af9fcb42db0d5a5264246daac80e18ef4d9a331373ac966'
            '32f2a33a8e4a98e67223e11026ce026d7b80416c9fb2befd8a25f7fb2112b08e'
            'a0a3440f1d5830857310176d1c9f298c1310f625667b52210a18a4f742d29d57'
            '88e90360f28c93acbfd4b168672bf6c4ed551fc6d7bee1fc17164c7e8cf4ee9c'
            '75999f6d1c154e4c34b8fe23edcded6d71f5c85ceb9c1bee40444ff26f13b4d0'
            'f16786f6f2a8d3242a106905534ff81e891f0a05f8ac987631b047b84eb853dc'
            '06b57c045654c27a01e1347067adc520528f96172fbc57d7d3e7556b49b51737'
            '3b122b26e5a9dc81a3e119dbd4483105871f656808d6941ff3666ee907691e33'
            'b854cf71046d4708df8caddf7aace122c4487269ce21e78a6f81c8bed402969b'
            '98f3b4cc312e2d4593883f4490f9c88f7f8fd2c91e5de0950aa57ac0506b167d'
            'dbb8ed99931bf6bf5d5d068111ed7ade981eaebf153c6b1b13ee016eff132324'
            '9f4f0406f1215655e3e224bba16072e4a221ac0eb3757b5209de4c835e08d8fc'
            '729cbb76fa7a8a15ee8897a56c0139018926d3688d3ff622618ff3f9b99ac57f'
            'db30bdc46bd5f3e58755b51a5d80612d3e8febdbf82b744a3859e30faba05d3b'
            '52c4cc87f26e3495b280fc09a2d0ddb61cefaa21d595819bc4fd0cc5f85c9588')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
