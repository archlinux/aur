# Maintainer: Chris Höppner <me@mkaito.com>
pkgname=armok-vision
pkgver=0.7.2
pkgrel=1
pkgdesc="A 3d realtime visualizer for Dwarf Fortress"
arch=('i686' 'x86_64')
url="https://github.com/JapaMala/armok-vision"
license=('MIT')
depends=('dfhack=0.40.24_r5-1' 'dwarffortress=0.40.24-5')
source=("$pkgname-$pkgver.zip::https://github.com/JapaMala/armok-vision/releases/download/v0.7.2/Armok.Vision.0.7.2.Linux.zip"
       "armok-vision")
md5sums=('c31d7bf9ce52546bcb380b67e061ecbc'
         '76daf6967fcc4cc51e04ef14ab665200')

package() {
  mkdir -p $pkgdir/opt/dwarffortress/armok-vision
  cp -r "Armok Vision_Data" $pkgdir/opt/dwarffortress/armok-vision/
  install -Dm755 "Armok Vision.x86" "$pkgdir/opt/dwarffortress/armok-vision/Armok Vision.x86"
  install -Dm755 "Armok Vision.x86_64" "$pkgdir/opt/dwarffortress/armok-vision/Armok Vision.x86_64"
  install -Dm755 armok-vision $pkgdir/usr/bin/armok-vision
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# sh-indentation: 2
# End:
