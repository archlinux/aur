# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-370
pkgname=arma3-unix-launcher-bin
pkgver=370.82233f6
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('7f3b42f193100aafc31dd9951f8dac6c51502ebcbdc8c16f88026444815590ff')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
