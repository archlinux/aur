# $Id: PKGBUILD 249446 2015-10-16 23:56:13Z seblu $
# Maintainer: Sébastien Luttringer

pkgname=agetpkg
pkgver=4
pkgrel=1
pkgdesc='Arch Linux Archive Get Package'
arch=('any')
url='https://git.seblu.net/archlinux/agetpkg'
license=('GPL2')
makedepends=('git')
depends=('python' 'python-xdg')
source=("git+https://git.seblu.net/archlinux/agetpkg#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd agetpkg
  install -Dm755 agetpkg "$pkgdir/usr/bin/agetpkg"
}

# vim:set ts=2 sw=2 et:
