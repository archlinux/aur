# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20260326
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="https://www.silicondust.com/support/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=20230505
_HDHR_EU=20230505
_HDHR3_US=20230505
_HDHR3_DT=20230505
_HDHR3_EU=20230505
_HDHR3_CC=20260313
_HDHR3_4DC=20260313
_HDHR4_2US=20260313
_HDHR4_2DT=20260313
_HDHR4_2IS=20260313
_HDTC_2US=20260313
_HDHR5_2US_4US=20260326
_HDHR5_4DC=20260326
_HDHR5_2DT_4DT=20260326
_HDVR_2US_4US_1TB=20260326
_HDVR_4K_1TB=20260326
_HHDD_2TB=20260326


source=("https://download.silicondust.com/hdhomerun/hdhomerun_atsc_firmware_${_HDHR_US}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun_dvbt_firmware_${_HDHR_EU}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun3_atsc_firmware_${_HDHR3_US}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun3_dvbt_firmware_${_HDHR3_DT}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun3_dvbtc_firmware_${_HDHR3_EU}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun3_cablecard_firmware_${_HDHR3_CC}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun3_dvbc_firmware_${_HDHR3_4DC}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun4_atsc_firmware_${_HDHR4_2US}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun4_dvbt_firmware_${_HDHR4_2DT}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun4_isdbt_firmware_${_HDHR4_2IS}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_${_HDTC_2US}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun5_atsc_firmware_${_HDHR5_2US_4US}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun5_dvbc_firmware_${_HDHR5_4DC}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun5_dvbt_firmware_${_HDHR5_2DT_4DT}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun_dvr_atsc_firmware_${_HDVR_2US_4US_1TB}.bin"
	"https://download.silicondust.com/hdhomerun/hdhomerun_dvr_atsc3_firmware_${_HDVR_4K_1TB}.bin"
        "https://download.silicondust.com/hdhomerun/hdhomerun_hdd_firmware_${_HHDD_2TB}.bin")
sha512sums=('3ca3f54ec7d5793172dbffe6f67e85c53242a7574a7f9415d598719cf8c6bafb735d231aebb4de65d842a044b04fb42362f1ff931a9c72c130f1435a62edfc42'
            '475ee09fab5fddca360be0535d9aa1b815a1b4a5b3eb68cfb7cc9877a2699b92ae47881f7a7390df4d67609c731d7b14819854e3f425fcfbf81f28996825adec'
            'aeb20cebead36e1e4d5fd44318f0bb9570e22e1dcd0e5888a10b095183348abaa860283deb371e3eb0a40b6414d8db44824c6de00ba7f0cd06fc7fbe28912f96'
            '31f42751aa3df0d8975ed647800c2cba77cb2e8fcccaa7680a4ef7a633a8d8fa309c03c769361729b296daaae484e21a71e776f4dac3032fc0046015da71b935'
            '3d921679c67c42b1e987fa8d45e3317908f4e8256c1b670e550c925c69c09128edf19689f5cd8e0f11abcf1ef35ce470783214d36ed6e9c187c6a7a438d91c6c'
            '3a2137bdd3c3bb4f3b2e9aaaf968f7ef67c6a92e4a119b5c0305bfdc5b1727a0058c1780a5f66f55865257c8703af1b3aa7553d6a8b09cde7ff0980060cb69c0'
            '19c832c3450bb16b74449450a373af606b66a18dc0472b41f521a2ddb7daa7997169a6a84137efb098f041a345f30af0d6467d5dc74d3487838a1135630812c5'
            '33ee353284abb1ac0b02200745a569f5ef3ea767bca477fcd8ad022e5c86fd6b68fa5ad0ccc6a2ee87a04ea8ade2592fedf9d87ed86d0743c8246f6e0ff3f6c7'
            'd1687b5782090f6abdd0cc492e4a6e9843a5439eed6d2b38d4bc6c5947a6b0e3143dea4279119f2c385dac6e3c765a471afcab2ade2b8a7b08361ac540f334b8'
            'de1b5b65efb003ed156cd5a56816fb3de22df47db014d92f8b2ed29c4f4604258a3de6f0f4a3f044a5a7c2095fc9bab8d4567af65a2bad13ccd502319618e7f1'
            '725abbadb6a05064835c27bbf56c43d1dfd4e98061cef3e6823622af17188a16a7196a153b0a41c6439050335360e70737d172da09428fa8a371feb2512bac3b'
            'ae66eb863df0cd884719375cef805ab65d3d04dbedb49e6d19b5a6d629bbfc83a10b5e7660187a86cdabdd8aa70cf69072720cb12bfbdf4b4adb6b854a7a75ff'
            '870306d683617259a1ab16e57c8a95949b585812b4a5141e29cbe2ca32c93b08ba0c3910a59c02b64277cb60a7bc4a9dfaaf6f4b4bd730ddf00ad2b79cccc079'
            '14371527d60cec88d011c06651702f25e0a17f15a9e65d6074d5a3dee99284729d086e6415460f256bc49fe58cd641017b3e34cceb6c24e65da295ca2407f543'
            'c53d0f6bde647382928e8af37a94224a8d3918aa7299715441ef8bf229b8564a5aa83cd05d285912e615170994d617891b3e16ce24d0739475843992cbed639a'
            '9ab89d5cf4e5ad06b29875c8663375ffd0e89b1d8b6191db08d6d7cde895e450ce286816ae46f524903ec5b8f26cde852d15117a5f6c5329bc8344d7abe82363'
            '912ab5d293c0c00ff82428ac190a9acf5be5341cf7138b7023b662c69c237110b465194e92fec8910f3a8f0c8e69f0f01eea895bc3e1c19e8dec50ac483d0125')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
