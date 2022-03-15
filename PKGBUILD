# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-352
pkgname=arma3-unix-launcher-bin
pkgver=352.3427529
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('7ffb74841b9a790122255c17227dc098097dfdcbcff2c0de68154939624f9339')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
