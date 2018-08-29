# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

pkgname=weechat-autosort
pkgver=3.3
pkgrel=1
pkgdesc='A WeeChat plugin: Automatically keep your buffers sorted.'
url='https://github.com/de-vri-es/weechat-autosort'
arch=('any')
license=('MIT')
depends=('weechat')
source=("https://github.com/de-vri-es/weechat-autosort/archive/${pkgver}.tar.gz")
sha512sums=('4c7715de74d493f75a2c926dde66b02d576caacaaeaf6005722cd31853b341d7ea643392b7c11e0359eda853018533e4609279b0fd63e001a7ecac1401b09c64')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 autosort.py ${pkgdir}/usr/lib/weechat/python/autosort.py
}

