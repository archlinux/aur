# Maintainer: Huang Yifan <yifan0610 at foxmail dot com>

pkgname='catppuccin-qtcreator-theme'
pkgver='1.0.0'
pkgrel=1
pkgdesc='qtcreator catppuccin theme'
arch=('any')
url='https://github.com/catppuccin/qtcreator'
license=('MIT')
makedepends=('git')
depends=('qtcreator')
source=("git+$url")
sha256sums=('SKIP')

package() {
  install -Ddm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 $srcdir/qtcreator/LICENSE $pkgdir/usr/share/licenses/$pkgname

  install -Ddm755 $pkgdir/usr/share/qtcreator/themes
  install -m644 -t $pkgdir/usr/share/qtcreator/themes $srcdir/qtcreator/themes/*

  install -Ddm755 $pkgdir/usr/share/qtcreator/styles
  install -m644 -t $pkgdir/usr/share/qtcreator/styles $srcdir/qtcreator/styles/*
}
