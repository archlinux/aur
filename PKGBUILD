# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-217
pkgname=arma3-unix-launcher-bin
pkgver=217.de66aa2
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('93b1dba0a07adc42f03276cd04a9b8c566f86e3a9b7b637af2bac5e0a5c73979')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
