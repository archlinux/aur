# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-383
pkgname=arma3-unix-launcher-bin
pkgver=383.fd68309
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('859d6e6831b908c9596e5560831063d7062ca2fe6fdc95a145ca0c50bb4ae994')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
