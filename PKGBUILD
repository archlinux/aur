# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-321
pkgname=arma3-unix-launcher-bin
pkgver=321.fe456c0
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('111ebeb54fa15a59da0edf0096ef1d72521cdd8137e7260ec20c01e9925bfda8')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
