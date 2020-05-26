# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-212
pkgname=arma3-unix-launcher-bin
pkgver=212.4a9d41a
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('6c2639fa11534f0f12dbc36ca35698a1b2b003d86b2afcf4ff197354a2489d05')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
