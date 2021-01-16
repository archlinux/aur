# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-272
pkgname=arma3-unix-launcher-bin
pkgver=272.87ec35b
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('86ea342cc9ae6b88d0e7fe9fdfd531c83de3402e73b9857c4a39967e0ccb2759')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
