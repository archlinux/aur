# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.cs
pkgver=2096
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a czech theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://sourceforge.net/projects/simutrans/files/Pak128.CS/nightly%20builds/pak128.CS-r2096.zip)
sha256sums=('43338823d027fc6a2d330e77033f3be6f0f08916b5d97d89766d58879289efe4')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.cs"
  cp -r pak128.CS/* "$pkgdir/usr/share/games/simutrans/pak128.cs"
}
