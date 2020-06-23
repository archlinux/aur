# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=libusbmuxd6
pkgver=1
pkgrel=1
pkgdesc="Compatibility symlinks for libusbmuxd.so.6"
arch=('any')
url="https://www.libimobiledevice.org/"
license=('LGPL2.1' 'GPL2')
depends=('libusbmuxd')

package() {
  mkdir -p "$pkgdir/usr/lib"
  ln -s libusbmuxd-2.0.so.6 "$pkgdir/usr/lib/libusbmuxd.so.6"
  ln -s libusbmuxd-2.0.so.6.0.0 "$pkgdir/usr/lib/libusbmuxd.so.6.0.0"
}
