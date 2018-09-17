# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20180817
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
_HDHR3_CC=${pkgver}
_HDHR3_4DC=${pkgver}
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
            'd2c614d0d016dae5f2392a0aad4af22e3b20763fb15ae7d684e1e885d1ec432b'
            'e39f5f792adcd717cfd22d0c25558cf7218add6c208862f322a87f99f743f734'
            'a0d875fb7f5d610078915487330b0aff1d5002beb7367038f8520a4463063903'
            '2d5a933578cf68b2cd3e263e0c564e26d8be38c8746f90ff8cc7d7f376821f8a'
            '349e475717d0339f7af16fcba70ee2b58910d73295556a3bd6d1fc08cc48bdf7'
            'bf7f0b41f332a423c03e6f8d317d55ea24e19485b682fd705dfc0a178b56fea1'
            'c92cbd39e89686cbb0eaff5fbe15012ad865f81707fb8fef59252a3cd9725911'
            'f7c69d536f8585334e64dff7fbe7d630d628730b94d143f3f682e14bef20d780')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
