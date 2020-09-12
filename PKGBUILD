# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-243
pkgname=arma3-unix-launcher-bin
pkgver=243.8d52963
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('272c260677872e81ced6ae483bf90ef0865a95ec98faffd86d40e617ff2f6a8c')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
