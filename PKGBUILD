# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-293
pkgname=arma3-unix-launcher-bin
pkgver=293.622951b
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('7e23d6bccf9ed1de567709a9b29a507cfb730eb6664624e21acec66a0ad68cd9')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
