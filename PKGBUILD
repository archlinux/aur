# Maintainer: Jonas Gierer <jgierer12@gmail.com>
pkgname=mdloader-bin
_binname=mdloader
pkgver=1.0.3
pkgrel=1
pkgdesc="Massdrop Firmware Loader"
arch=('x86_64')
depends=('glibc')
license=('GPL')
url="https://github.com/Massdrop/mdloader"
source=('https://github.com/Massdrop/mdloader/releases/download/1.0.3/applet-flash-samd51j18a.bin'
        'https://github.com/Massdrop/mdloader/releases/download/1.0.3/mdloader_linux')
md5sums=('c9a793fade06ef949bd426c2ad620367'
         'f4c586a3f7ed07419eb4b535d6d0f650')

package() {
  install "applet-flash-samd51j18a.bin" -Dt $pkgdir/usr/bin
  install -m0755 "mdloader_linux" -D $pkgdir/usr/bin/$_binname
}
