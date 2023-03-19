# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20230303
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=20221023
_HDHR_EU=20221023
_HDHR3_US=20221023
_HDHR3_DT=20221023
_HDHR3_EU=20221023
_HDHR3_CC=20230303
_HDHR3_4DC=20230303
_HDHR4_2US=20230303
_HDHR4_2DT=20230303
_HDHR4_2IS=20230303
_HDTC_2US=20230303
_HDHR5_2US_4US=20230303
_HDHR5_4DC=20230303
_HDHR5_2DT_4DT=20230303
_HDVR_2US_4US_1TB=20230303
_HDVR_4K_1TB=20230303
_HHDD_2TB=20230303


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
sha512sums=('c593f91e8e9cf03377799b8958e5266f4f5e4f1f694ac85022823eca7c288ab59a64e0a1c7920f198a9f7b23a6e4b6f9829d87dcc5174b74f6eb2d0d4c838bc6'
            '3e41e3c46918734254a50efa632de85cdff63ab43b74613470998308d997c229dd90f9aa582687bac3ee703d0149b13a18d084f87fd5f3a0599a3b0d637a2cc5'
            'e9b68256c4e801dc005414741de098b8be400f592ac2ebcc3a1d1d5c266f14f641a34c13db717a25b0b91cd6c468a79c3ce47594af8568fc375904a4fe676f96'
            'f81d03f768e7a8e025f1bbd17ff6e18e6927e47d28defc56755aeed22fad01c17742aaf45e7874bddf19a075ec9cde46e47c17d0ae2c45d0578d25f98f36c704'
            'a7c3a1f2e38227e3b70878637722337166a5483dd59e024526f0cf4b94eb185f9e4812d74c9e2520cc6985e761a54d3743a9db1caa2c454a3e315771a9ce1308'
            '738d0957d8bbde0ea213cb067a1aceed35003e03c107bd307982c94085bd01f112f922b75bbcd812dac6f475ab4c95d051549f4298fb63512aefea1da7670728'
            '08e5eb92f721d93dbd0c4375de88ddd18e471385e6248519eee6c692369c7c2d1edf8791e494099ed19b0ed9fe8ff4398e7c3c7a49328b213e72529e65d596fc'
            'f4ecd9826b435a36b9869fbe301677254001665083e505702357cfc961d1b996c0808a796a7ba4f882f3685b3f8c94b1758cb77fdc9e4846b56e3531f7910975'
            '3c9b763238d25184f5a617134eff0db01f5f513f2870d0bc482bd02cc26ff8c33259a3de87c59057677992f57980b820eb36849ecee69cd1c6c805437679e7a9'
            '3ada5842e7388408a1a1f2b757e1e7a0267aa4dc7a992d3c63a97a9e253026bc52f76b444a9c7bb32e7ead943c00166b5fb0c2364cfedc1ed4363a8b564371f8'
            '0b9386f47892e57456ba4014f0542890ba5d8275c71d86f5eb1f9c6b4eea54c5d009cb6bb1e9db19d3ae83ca9e9d7030513270f95b52a4fe272b620bc90a0e3c'
            'e987e9879588e65d45bfd65d8beb796d7b4b5bbbc40336ced1f2dde61c9412c38d0513d00e57159a421b433f0b0e1fdc6f8f30c124df421dfae8d4780810e0fc'
            '4188040998d32fa98fea88d5f5b5bc5a72784432643b7bd0b8bd858c078bb3d3d73db52e33cdecde33b982bdc9c9eac0b1c681b2486cf38b743f300394ef23d1'
            '1bffdd2994b52d1dd82dd71f928c0b785fb4ce776f948bb14c9536a4a0cfd8e395814abcec276fbe9bab6becabbff1212a46dfe1b089f8605cf7d33f9362a160'
            '053b1e801075daf7df1dce8444ebbfa5a6caa28b562ad40ec22b8a74811e61527bbd3ec711846d312e9d9e0fdae7f02fc90507f284bba0e6a85dfb982f9e6ea4'
            '339c26c63fecc93d96cec8c069af204bc16797564857b7391132b2490793331b33fb7dc5058a75ffce4af82bf6f94134574b19950051bff25d2e07111c70d6d2'
            '2db7d86e4d676e633c66337329a58a0e0b1c75f534973b87d98e5aa93674ddb7d34cefd8c0df39c7b5ec26566bfc621cee0d3db5045b220ba02b2d48d2cd5cb7')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
