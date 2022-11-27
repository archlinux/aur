# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20221031
pkgrel=2
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
_HDHR3_CC=20221031
_HDHR3_4DC=20221031
_HDHR4_2US=20221031
_HDHR4_2DT=20221031
_HDHR4_2IS=20221031
_HDTC_2US=20221031
_HDHR5_2US_4US=20221031
_HDHR5_4DC=20221031
_HDHR5_2DT_4DT=20221031
_HDVR_2US_4US_1TB=20221031
_HDVR_4K_1TB=20221031
_HHDD_2TB=20221031


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
            'a09f7ce3a530f41baaad902a38420a86574c98bf615a8cbb0d8dcf282e19a5133f51f98d88b0e21170b9bf0796a78e31c2b9ded0badcf7e7ec16da0ab3535261'
            '04db7e74b1936171b3a6bcfc4cb341354e48372678c8e99786e046fd9a4a7a383cfcaeca3db97f4298347b02129147c0832808396a390f3dc2cee9896a56c41f'
            '31eb6eeb5aae0aa5d4c0c4c15e42165cc10619a481526992c5f3d47c53e65cf9a0c90a30df979118092a67a387d389b0fc75ee624ada0bafa5bc79760c440fbf'
            'a504214718cd7ede084f03bbca26c429c61a56e7915aa9c808e62bc5a6fc376f47847bda87d551e67d5f1a43d843a866ba31deb4ef006b3deeaebfabcb823a98'
            'ab5f4b6935a7132b731f5c83589de102b27f5318995510a7b48ec6e0cd521a18b6fdb2e59f09ffb200f7f4d18d9966fcfd36c2fe973c79e85f254a8e69fe136b'
            '91d115615f00ee3ab64506abcb34755ddaffb9e626344c2f013c0380a95cc28cbbd9f9cf426347e2c7c713d83bf803e535b6e1f8bd11ef5585360d24875426b6'
            '9ae400d6cfd6cf02ea2f7deec2c619219a4b8193cdde164ca6d79f67119c1cfb5336c56d6f2d30a933336f9bb8b721175bcb91f353c953688daab568016e6a59'
            'af03859da7be6f9813f34597ca5c29e60d17ae31379f7e9b54d0eae612501edc2997c14872c03e15d253dbc1576a296c97049495d9c26721c4d67b1277d4035f'
            '9d4826d5217fab0d51bc224747c6b99051369ce0bb8bcc127e9a6f00c23f236c77f2ba7b9c0eaefed6bf9fac6af8ba96dc260110b1f63d9a3d5db1f5c351b330'
            'e3387d07ae367384abe5f16686635172fa1cab76bb014d993410452321f4226cc24023471e5c6dc9fa80a811a5e435b3b4809a2b214a595615a69685e0eb2a73'
            '9f1a5ed4f01cb3ac9c0936f3049a445dfc293f19fd1108018a4942f13d93884ab929947c897b0c87ab9725352315e57263fb158fea997e9b3dc5c7aefc00ea0a'
            'd88c597cd36dcf6f9db2f8e05fde2a7a13bc50888dcf22371599329c8fa9abff941068ed0b2654430f0a43cb083f71068709fd4d191dfdf2fb57df53fea8fa8d')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
