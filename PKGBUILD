# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-453
pkgname=arma3-unix-launcher-bin
pkgver=453.ec12e5b
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('53529f0731e01db88ae2838d0ac6136c6d753926fe538ca43f6a003cad4b2185')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
