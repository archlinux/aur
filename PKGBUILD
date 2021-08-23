# Maintainer: Hayder Majid <hayder@riseup.net>

pkgname=masalla-icon-theme
pkgver=1.5
pkgrel=1
pkgdesc="A flat design icon theme by Hayder Majid"
arch=('any')
url="https://notabug.org/masalla-art/$pkgname"
license=('GPL3')
makedepends=('git')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('84cf3938200bfeeef272df34d221e9ad')

package() {
  cd $pkgname
  install -dm 755 $pkgdir/usr/share/icons
  cp -r masalla $pkgdir/usr/share/icons
  cp -r masalla-dark $pkgdir/usr/share/icons
}

