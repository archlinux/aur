# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20200907
_legacyver=20200225
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=${_legacyver}
_HDHR_EU=${_legacyver}
_HDHR3_US=${_legacyver}
_HDHR3_DT=${_legacyver}
_HDHR3_EU=${_legacyver}
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
sha512sums=('b1ce0348f76614833fa410b54c188ea2f302d95641fe977f76709d070b22ff562f017f0c5cc4529d279ae8d12696c7c39a0e057d95b288aa59111bc4973fd53c'
            'ca3aaa7dcb5a8b21f8bab382b59034d83047c3f64dba16c0747dcae87262ec457b87caf63eeba0487b26cd102498dabdc3347e90a39c8f2f0c2852e2a1eba80c'
            'a4210bfb1eeb3773da71c15a00b464b0123bce7dbb2be039273ecf83dc422698cbb4c00e7c1ce4ad98d45b475c23154a5e6188c2821475a0e641cbfc89e3f106'
            '0c7e44c70c350f054980853ce450b356e2e7d321d4f1ed654763ac23b970c2bab6a404bbfe78315d15ecb9b25622abaf724ff7f05a69d196f39cb105a33a8f71'
            'b3d464684ac52b8096bf6f88f8d445e0f8075064871e3dab79a7d16698df6c72d87d021d4bbf1ed6a32dda27589c7320199a8f63c87b633bb4faad5c593f0fc6'
            '331cc71afada07324b397eb2aa8ac9d0a8b23d5c3ee442f438d95a5bf9054db1078d94e8683004c9a9a0757a9ce34fb2261b3fefd8fdfae85751b9f81fca706e'
            '619f13f57988d0846d43e27ffb3e1214aef3f2a993fd2d5ce10b54fc312a06e592b9d141df59fb6a32f26c9fc0a185d228e2f969d8dbacf6d8c74f006b263e01'
            'e499a95819647c0a2e71f1f9a676736466391753e0a4334e3435e568524d7cf9c75a95721d5bd8e78a61d1c31420629263304010446d204e362df55b108d7c78'
            'a146f845a815e7e4809460422dc48b79e70801ccab794f787e3b93192e90d95533590425b8b19168af01593f9a505a5c386a72fdee3d6bdb0ef60358880e094f'
            '20dff58eeea433c4ab9540db3fb5724dfdd1a0f41b0173cd18da5185fb63c2f5365c587132cbd26214c25a3798484075b6cb86c5588382840a9e0fdc3706576c'
            'd3e8362424df31aabde831ec0372f259260ae511fe070abc24136280942645f2e20c65ccd61d99a5644e77c541635cc58e1ffae4f2f2eb268ed1725de2e9cfb5'
            '39b2f61cc40e1e94f5135eaf212018f70adaf0a937ae99a4382e19e624d272f5f2b4e5245c5aab280f2fdb964ce8ba3a55b8d2107812b531af6bcd4c10c9b83f'
            '181a35ab4d078f437403b31c83c7d46b70bfba9efb9954599dc4ed65244e47c0c16de3c11ed3ec57b225c37fe6df60c4a501f9271a11c9e612c733730aa0c540'
            '84360be0c6b2f5a929e58732222117b517a2478b1f6c8b950a256fdcb4051b38f427d565843242861be987e273574e996f21c701adac0ced849774651c82ea05'
            'a737b7427332e062d58ec0d473d0690fda77059774fa89c8c905abe9acdcbd5b76f5d489fdb9bcdfe499561eeafb2dc2536674c556d1bb08961b2b1ec5d18d7d'
            'ca08054b96b65d635eb02da0ea9d5fb13ef532a4055004a3c20fed4ab31187e40f15c3065f3254d0635a5599f5d2514dad07f318c2f7bf4252d89b157661ae24')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
