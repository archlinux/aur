# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-pinux-arch
pkgver=0.3
pkgrel=1
pkgdesc="Arch Linux only theme based on Pinux's Tux Cursors"
arch=('any')
url="http://www.kde-look.org/content/show.php?content=19506"
license=('GPL')
conflicts=('xcursor-pinux')
source=('pArch.tar.xz')
md5sums=('ba184bf1d77b4387bfb9bea1945fe783')

package() {
  mkdir -p ${pkgdir}/usr/share/icons
  cp -R ${srcdir}/cursors/* ${pkgdir}/usr/share/icons/
}
