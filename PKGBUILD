# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20220203
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=20200225
_HDHR_EU=20200225
_HDHR3_US=20200225
_HDHR3_DT=20200225
_HDHR3_EU=20200225
_HDHR3_CC=20220203
_HDHR3_4DC=20220203
_HDHR4_2US=20220203
_HDHR4_2DT=20220203
_HDHR4_2IS=20220203
_HDTC_2US=20220203
_HDHR5_2US_4US=20220203
_HDHR5_4DC=20220203
_HDHR5_2DT_4DT=20220203
_HDVR_2US_4US_1TB=20220203
_HDVR_4K_1TB=20220203
_HHDD_2TB=20220203


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
	"https://download.silicondust.com/hdhomerun/hdhomerun_dvr_atsc3_firmware_${_HDVR_4K_1TB}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_hdd_firmware_${_HHDD_2TB}.bin")
sha512sums=('b1ce0348f76614833fa410b54c188ea2f302d95641fe977f76709d070b22ff562f017f0c5cc4529d279ae8d12696c7c39a0e057d95b288aa59111bc4973fd53c'
            'ca3aaa7dcb5a8b21f8bab382b59034d83047c3f64dba16c0747dcae87262ec457b87caf63eeba0487b26cd102498dabdc3347e90a39c8f2f0c2852e2a1eba80c'
            'a4210bfb1eeb3773da71c15a00b464b0123bce7dbb2be039273ecf83dc422698cbb4c00e7c1ce4ad98d45b475c23154a5e6188c2821475a0e641cbfc89e3f106'
            '0c7e44c70c350f054980853ce450b356e2e7d321d4f1ed654763ac23b970c2bab6a404bbfe78315d15ecb9b25622abaf724ff7f05a69d196f39cb105a33a8f71'
            'b3d464684ac52b8096bf6f88f8d445e0f8075064871e3dab79a7d16698df6c72d87d021d4bbf1ed6a32dda27589c7320199a8f63c87b633bb4faad5c593f0fc6'
            '9fdeb39699fa952fa5bed6d66bbeed9a70311caceab8f61494d5454b615c1b70f8c1daf50e3818cdf221940fbc71d3a11e07d4710de8a51dfe8656d8b00ce88f'
            '6fe4f7a34bb5b63c6db02f67f6ae611ec02bdf9492215dde26d52f6a018514f7efff6b07457192b71269d8071a221c6991add3f5c22e3834f75695e18a081c89'
            '5599f4fe2139fbac63afde18aea78ea7046c71960bc02313f6b764df415c9388e81aeb4cb3371d1e4943f868c1648f0baf04aecc4d8666e05ffeb8bc7e24f8f6'
            '6133360c28c37f04c18b306630ba1c38cf7f12e0c92a08583290db4f13d4d470558c94b33fef60b7eb8cbe1423a89fa1245246ef2bfbb9cc169acb69608b969e'
            '404f3f5b3c985e8834df35696455b98c7dcb54df9b3b65cf750c76ad969da6a9336ed55667684a6aaf8deff3c199ebcb7d4305b8f1852bad4717089de51dfa00'
            '211116d246f65bb91c73755728f3e40190546a5cc802b4f0e0026a3d794a02128660edb69047c911d328c089cde44f88235f0dc49cb520198a1db84af8f3199f'
            'c761ff8bf5801ed9396664663721bec8abb272f3ab450739747312f49f017242807ae2a19d5fcd01bc9be9f1bb1acbc567d8e8b6461e6f0d722d3c9c378521bc'
            '7d1cb4974947fccb925292d9655757fc2a5b6eb0965b5f0d55f31a355cbd6a9f8507adc6e27d2024e5d46b988167533b2a6671a677276dc6ab9340644311a724'
            '03b36c4edc9ec1f16c4ba3fc49ca0f49b7fe33ccbeed132d17ba095a19e49570eae78538c7043441d8e4a17a777fee630e3ad826c4ea5fc0462aa2aec3e2ae33'
            '94fdd3a95cad5160ce7c30afdeec873bc5045adba8f8f5118e68590369a95b2ff044e0d24a6a27cb45c1e6b46fd3d92c4015b135590c9655235fef76653d7fa7'
            'b4ec18257dea7df50415342a19408eccaa5db171ba7662cd785db18f25153065fb40c955172afaabf9f7701d8f5566cc7c2db142bc967272d8032f2188ffc226'
            '590fcab4d47ea3f9d8ca0b7d2ae6686d2f10194ab99063fc976386c7d553d17721abc83d6843397016af4590d72333df53ea4a7482683bbcefedb003fc89cb20')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
