# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=hdhomerun-firmware-bin
pkgver=20150615
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
'hdhomerun_config_gui: hdhomerun configuration gui')
source=("http://download.silicondust.com/hdhomerun/hdhomerun_atsc_firmware_20150604.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun_dvbt_firmware_20150604.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_atsc_firmware_20150604.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbt_firmware_20150604.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbtc_firmware_20150604.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_cablecard_firmware_20150615.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbc_firmware_20150615.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun4_atsc_firmware_20150615.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun4_dvbt_firmware_20150615.bin"
"http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_20150615.bin")
md5sums=('c7a923dc6f2d31fb745d9dcb5beb7573'
         '0287c79796410af7fa7aa44dfeb2105c'
         '4d06d357a5e914084ef97026018aeeae'
         'e8a6562cdda1cdf398b4d7862f94b695'
         '6c980e787ce5ca66a9a03e5d147e67d0'
         '378825b139d14a9ad5a7ac57fcdf65aa'
         'aa54ce4ce3816e177223d023ff4385e2'
         'df238836fb89e26fa8584a2ec2cc9751'
         '2194cf7f9c0a72c80067fa8095a58c59'
         '9acdbc1552135b56eef54a6ad8c6fc1e')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
