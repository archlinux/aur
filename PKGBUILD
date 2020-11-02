# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-254
pkgname=arma3-unix-launcher-bin
pkgver=254.98b74b6
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('3f53b47610ef677e3a0bac462a4dce3508408ed12426ee6b7830a514ce79e632')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
