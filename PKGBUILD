# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=wepcrackgui
pkgrealname=WepCrack
pkgver=0.9.2
pkgrel=1
pkgrealver=Rel_09_2
pkgdesc="Wepcrack is a mono gui for aircrack, aireplay and other related wep cracking tools"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wepcrackgui"
license=('GPL')
depends=('mono' 'aircrack-ng' 'gtk-sharp-2' 'mdk3' 'gksu')
source=('http://downloads.sourceforge.net/project/$pkgname/$pkgrealver/WepCrack0.9.2.tar.gz')
md5sums=('3cb67697a2fbdf268e4bc098691aa0ff')

build() {
  mkdir -p $pkgdir/opt/wepcrackgui
  cp -r $srcdir/WepCrack/* $pkgdir/opt/wepcrackgui/
}
