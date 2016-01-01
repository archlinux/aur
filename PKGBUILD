# $Id: PKGBUILD 129917 2015-03-25 20:02:54Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Ner0

pkgname=gtk-theme-orion
pkgver=1.5
pkgrel=3
pkgdesc="A modern and light GTK theme"
arch=('any')
url="http://deviantart.com/view/281431756"
license=('GPL3')
optdepends=('gtk-engine-murrine: For the GTK2 theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shimmerproject/Orion/archive/v$pkgver.tar.gz")
md5sums=('da7e92aa221e0d4a57da856a63354dd3')

package() {
  cd Orion-$pkgver
  find . -type f -not -name .gitignore -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/Orion/{}" \;
}
