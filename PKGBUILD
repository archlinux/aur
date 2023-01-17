# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-381
pkgname=arma3-unix-launcher-bin
pkgver=381.018ce55
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('4b86d5a10b16953f93f1c260ac0c0ed4e94bf76055d94f708ca8369c570a2f93')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
