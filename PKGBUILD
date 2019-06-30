# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20190621
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
sha256sums=('5b0a2324536fe1149c5d1f3cbc27c2e8bb90840114ea55764c97053543d94bd5'
            '01a3d077a897abde1ee5a798474ae92adcd5b2ef7786c26d78e89673a72c385f'
            'c9b1fda0b7765883b718298a7302b9c527559ceb97315e22087dfeeaa16625ef'
            '46167b04e5f7d94c0f16d17cf37c10be6ddb4f7f45b5b061b7943592038e021b'
            '732a808ad9997994db7c72344f1731099bdd85b29c8709235bb50b0b2188fe54'
            'acbdbf4a810c59fece2b5959de825c6992366291fc13f253faa787c4ddeb1b3b'
            'a053f436501a51eb4992ec7de6a0d14e62673fad38e5d2f99bbd44794a26b556'
            '2c5fb67be85b4574f834396174098116caaae56161ff3d38d82adc674d57aa55'
            '48943a7a5a819a6494b550376597a76de38b74a8245881993d49927af4ecb065'
            '5ad53d1e6f443b9c00184dae506e79879aef86fd34b15c2481ff7dc55f4d57bc'
            'dc13a5d9364cbea38071413052895a74c86df9cfa7bee38505d17b22e92beb49'
            '7f4886ef8d34e51a97ab3470a8ff5cb803660fb5654f96d4b57bcb5129978c88'
            '095ead389a52c830608b0c3ba8d82086486d1b2b4dc1be4cbd440d6925137a90'
            '4adaf769b2edd25d012b9dd9e6e06f3e4027676fdbcb69b38cf576d951eb9c31'
            '879f2e1ee313e558e9207deb52c545779f0826df539e4aae7ebf032588197583'
            '35406cc06cac2e30cde1218d84dd779095c66d2e103e298664a923820aa65611')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
