# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-326
pkgname=arma3-unix-launcher-bin
pkgver=326.3081678
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('154164751686366607abcd7aae2048670e55bddcd7f3b562a1f2c1c4afdef35e')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
