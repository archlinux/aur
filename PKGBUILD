# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-267
pkgname=arma3-unix-launcher-bin
pkgver=267.95496c9
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('c59f47c4ef7e01af1e1689cce1e4bac989cec343851bc190a59742cb56cacc64')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
