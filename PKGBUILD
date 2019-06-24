# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Contributor: Frank Phillips <frankalso@gmail.com>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-libaacs
pkgver=1
pkgrel=3
epoch=1
pkgdesc="Enable libaacs emulation from MakeMKV"
arch=('any')
license=('none')
url="http://www.makemkv.com/forum2/viewtopic.php?f=3&t=7009"
depends=('makemkv')
provides=('libaacs' 'libbdplus')
conflicts=('libaacs' 'libaacs-git' 'libbdplus' 'libbdplus-git')

package() {
  install -d $pkgdir/usr/lib
  ln -s libmmbd.so.0 $pkgdir/usr/lib/libaacs.so.0
  ln -s libmmbd.so.0 $pkgdir/usr/lib/libbdplus.so.0
}
