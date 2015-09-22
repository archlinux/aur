# $Id: PKGBUILD 72016 2012-06-05 19:54:42Z seblu $
# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>
# Maintainer: Sébastien Luttringer <guotsuan@gmail.com>

pkgname=awesome-revelation
pkgver=3.5.6
pkgrel=1
pkgdesc='Show all clients per screen in Awesome window manager. This is version
only working with stable version (currently 3.5.6) of Awesome window manager. 
For master version of awesome, Please install awesome-revelation-git instead. '
arch=('any')
url='https://github.com/guotsuan/awesome-revelation.git'
license=('GPL3')
depends=('awesome')
conflicts=('awesome-revelation')
source=('git+https://github.com/guotsuan/awesome-revelation.git#branch=stable')
md5sums=('SKIP')
_gitname='awesome-revelation'


build() {
  cd $srcdir/${_gitname}
}

package() {
  cd ${srcdir}/${_gitname}
  # Install the library
  install -Dm644 init.lua "$pkgdir/usr/share/awesome/lib/revelation/init.lua"
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 ft=sh et:
