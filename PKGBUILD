# Maintainers:
# Jonas Gierer <jonas@gierer.xyz>
# Ujjwal Sharma <ryzokuken@disroot.org>
pkgname=mdloader-bin
_binname=mdloader
pkgver=1.0.4
pkgrel=1
pkgdesc="Massdrop Firmware Loader"
arch=('x86_64')
depends=('glibc')
license=('GPL')
url="https://github.com/Massdrop/mdloader"
source=('https://github.com/Massdrop/mdloader/releases/download/1.0.4/applet-flash-samd51j18a.bin'
        'https://github.com/Massdrop/mdloader/releases/download/1.0.4/mdloader_linux')
md5sums=('c9a793fade06ef949bd426c2ad620367'
         '4dfad5b7d9e3c1f9ad480233843f95da')

package() {
  install "applet-flash-samd51j18a.bin" -Dt $pkgdir/usr/bin
  install -m0755 "mdloader_linux" -D $pkgdir/usr/bin/$_binname
}
