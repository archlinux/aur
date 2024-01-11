# Maintainer: spookyintheam <spookyintheam@proton.me>

pkgname=rose-pine-cursor
pkgver=1.0.0
pkgrel=1
pkgdesc='Soho vibes for your mouse cursor.'
arch=('any')
license=('GPL3')
url='https://github.com/rose-pine/cursor'
source=("BreezeX-RosePine.tar.xz::$url/releases/download/v$pkgver/BreezeX-RosePine.tar.xz")
sha256sums=('95859558840c2cc9e7c198a433479049e52b9b5c61f20312915c1dc2b0982a64')
package() {
  install -d "$pkgdir/usr/share/icons/"
  cp -a --no-preserve=ownership \
    "BreezeX-RosePine" \
      "$pkgdir/usr/share/icons"
}

