# Maintainer: Chris Höppner <me@mkaito.com>
pkgname=armok-vision
pkgver=0.8.0
pkgrel=1
pkgdesc="A 3d realtime visualizer for Dwarf Fortress"
arch=('i686' 'x86_64')
url="https://github.com/JapaMala/armok-vision"
license=('MIT')
depends=('dfhack>=0.40.24_r5' 'dwarffortress')
source=("$pkgname-$pkgver.zip::https://github.com/JapaMala/armok-vision/releases/download/v0.8.0/Armok.Vision.0.8.0.Linux.zip"
       "armok-vision")
md5sums=('433c181ae0b897918cd9996a479f8df1'
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
