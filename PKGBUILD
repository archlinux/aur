# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20220203
pkgrel=2
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
            '8bc8bd1f5fca55a9838a878834d2ce2cac45d525535b92037429ee7a6ad777d98bd2ee603cb453c7cb2694eafbe7ff0c904267f2725399e7013f40095fa6e85e'
            'bbe27ce60b4d2a3a7796169017d7de115e7ee92c4548b8d31b7ca3d0b66e1f21572490a93c09b76c44e31ae8efce7610d912e4f47ed8bdc22d1aae67e2efc3f2'
            '6d74931d318f1d97ccbc6c7f57a8faa55379adec4a64bc9fded2184d6a6eafbc5e959262adf7ea87db19cde29f381440826909d9aea44c279b72f73c84bcaebb'
            'ad1032ab722d65f3cb14c0d19c8e2dd419b17eaf587d4a229fef487bb52021557ab26ae02e069b8b1e4dda1c4e77d037645dd254fca44b4f2f9ebcea41d6a117'
            '2be28005ff49ecb3eb90446cb36a07685ad555e4f680274cf2d1ad13df0111aba5bf515731933d1fcafe67345ff5de8e620ef952fd966b0d0030cc1693e06f83'
            'e7c8cf7e67ea8c92f1f8de6c2943dc8d9f5abd251fafd7b21612ad06a076e746665e927ebbb1c0764346ad488e772f8f82da03dd7a9189c8f7ca0f68f0b93a97'
            'e25c4c3b0176857feea9a171efda1efae23f8af60055f954bc542253ad6ba9e660d54d8a8708825c2da190be078085056bf4f5ed79d9d0c59d793847bee1bb3d'
            '3f351bb6dc25b20079e8eecd5c7cbb268c5fc15fadf49cc7a0708a46aa4235596911486904a372a7ed174202a9f62f727797dbfee4d90a210d5c796340c47ccb'
            '503c096ea3b82a498c1608a78d670aad449b5cc47c99b7d043d469ba8f60767cfd2639b4341ed55502faea0b68b25b43a6111b8f7940649cbaedb067b93c99f9'
            '78a09377728e79a9700ce191699c6e406c6e6a50b9ba8fe14e1b1984ed076128572a7c322bbf7a4d7f0eb7562a2f11f52b87e95aca3495c21b85002d33e94c19'
            'b1172475321746501631716bfdbf4a464a25544cf4246931138b2590ffe972ed74c22b2abc9b11e02452d24a20f29cc13f58d9cd9405c4a65b6f3379960df171'
            'fd5f68fd1a67124898fc7194d679c207c3bbed50c225e8466a69f526c1a3ad043cdf0617e7c43306f22872a4f2f52ede13afae338507e0829f6f7b72db4a274a')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
