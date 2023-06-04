# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=libirecovery3
pkgver=2
pkgrel=1
pkgdesc='Compatibility symlink for libirecovery.so.3'
arch=('any')
url='https://libimobiledevice.org/'
license=('LGPL2.1')
depends=('libirecovery')

package() {
  mkdir -p "$pkgdir/usr/lib"
  ln -s libirecovery-1.0.so.3 "$pkgdir/usr/lib/libirecovery.so.3"
}
