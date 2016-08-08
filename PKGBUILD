# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=ttf-yas
pkgver=4.00
pkgrel=1
pkgdesc="The Yas Persian Font (with hollow zero)"
arch=('any')
url="https://fontlibrary.org/en/font/yas"
license=('GPL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=('https://fontlibrary.org/assets/downloads/yas/6d496aade0637f6ff0aed373a19aa54a/yas.zip')
sha256sums=('37290f03d6ecdc231832de4ef9c73678fe8cf180cfb33523129de874aa1bf65a')

package() {
  install -m 644 -Dt $pkgdir/usr/share/fonts/$pkgname/ $srcdir/*.ttf
}

