# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.japan
pkgver=120.0.1
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a japan theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Freeware')
source=(http://sourceforge.net/projects/simutrans/files/pak64.japan/120-0/simupak64.japan-120-0-1.zip
license.txt)
sha256sums=('f19830321f5bd5312f85b5471bc4adae2cb763dd9ee9c3d55be4c848e0f05c93'
            'f22ab540742769822ffdeb0ed3b221b0ddecb8bf63971e21ffa10811ec2c55c0')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.japan"
  cp -r simutrans/pak.japan/* "$pkgdir/usr/share/games/simutrans/pak64.japan"
  
  #license
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/simutrans-pak64.japan/license.txt"
}
