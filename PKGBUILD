# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-285
pkgname=arma3-unix-launcher-bin
pkgver=285.119c981
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('1fe1dd19c32ed8c6ca5d54f3cf0bcd24fb3188cba948a9b61bf4234d7775306c')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
