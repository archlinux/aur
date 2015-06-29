# Maintainer: Dylan Ferris <dylan@kanux.org>
pkgname=yii-docs
pkgver=1.1.14.f0fee9
pkgrel=1
pkgdesc='Developer documentation for Yii framework'
arch=('any')
url='http://www.yiiframework.com/'
license=('FDL')
options=(docs !strip)
source=("https://github.com/yiisoft/yii/releases/download/1.1.14/$pkgname-$pkgver.tar.gz")
sha256sums=('f9577b9aabb6e51067d297d79d0f4f2442f248060f378d73ddc9317b0b48ea61')

package() {
  install -d $pkgdir/usr/share/doc
  cp -r $srcdir/$pkgname-$pkgver $pkgdir/usr/share/doc/yii/
}

# vim:set ts=2 sw=2 et:
