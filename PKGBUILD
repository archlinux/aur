# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20150826
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
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
"http://download.silicondust.com/hdhomerun/hdhomerun3_cablecard_firmware_20150826.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun3_dvbc_firmware_20150826.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun4_atsc_firmware_20150826.bin"
"http://download.silicondust.com/hdhomerun/hdhomerun4_dvbt_firmware_20150826.bin"
"http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_20150826.bin")
md5sums=('c7a923dc6f2d31fb745d9dcb5beb7573'
         '0287c79796410af7fa7aa44dfeb2105c'
         '4d06d357a5e914084ef97026018aeeae'
         'e8a6562cdda1cdf398b4d7862f94b695'
         '6c980e787ce5ca66a9a03e5d147e67d0'
         '1197260246be3b0ba93981cf900498cf'
         '8da32d0cd1a8bece9547f7277563a79c'
         '573d604082bf24ad9ca56aba87243a4e'
         '93803870c91121f0b9e0b9f55a670a99'
         '004cd450da94b35211010e0e4aa6648a')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
