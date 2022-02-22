# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-334
pkgname=arma3-unix-launcher-bin
pkgver=334.990efff
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('0cd9509a3087e061a42dd342f688eededa3207a9ca54e54157e965f8ef2ce3b8')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
