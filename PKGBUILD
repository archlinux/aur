# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-349
pkgname=arma3-unix-launcher-bin
pkgver=349.21a891d
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('b5f82461f7d984e8ef33e9ce105ef07075e652184d20be937c4f02ecd60c31ed')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
