# Maintainers:
# Jonas Gierer <jonas@gierer.xyz>
# Ujjwal Sharma <ryzokuken@disroot.org>
pkgname=mdloader-bin
_binname=mdloader
pkgver=1.0.5
pkgrel=1
pkgdesc="Massdrop Firmware Loader"
arch=('x86_64')
depends=('glibc')
license=('GPL')
url="https://github.com/Massdrop/mdloader"
source=('https://github.com/Massdrop/mdloader/releases/download/1.0.5/applet-mdflash.bin'
        'https://github.com/Massdrop/mdloader/releases/download/1.0.5/mdloader_linux')
md5sums=('c9a793fade06ef949bd426c2ad620367'
         '77b25263f89fe3142a4bd016c5013cd9')

package() {
  install "applet-mdflash.bin" -Dt $pkgdir/usr/bin
  install -m0755 "mdloader_linux" -D $pkgdir/usr/bin/$_binname
}
