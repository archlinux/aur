# Maintainer: maz_1 < ohmygod19993 at gmail dot com >

pkgname=kde-servicemenus-unarchiver
pkgver=1,0
pkgrel=1
pkgdesc="Use unar from Unarchiver to extract archive files."
arch=(any)
url="http://unarchiver.c3.cx/"
license=(GPL)
depends=(dolphin unarchiver)
source=("kde_unarchiver.desktop")
md5sums=('842691abeb658aa65c0713a2e00af74d')

package() {
  mkdir -p "$pkgdir"/usr/share/kservices5/ServiceMenus
  install -Dm755 "$srcdir/"*.desktop "$pkgdir"/usr/share/kservices5/ServiceMenus/
  
} 
