pkgname=hyprdots-ctl
pkgver=0.01
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('unknown') # replace with your script's license
depends=('hyprland-git' 'hyprland' )
makedepends=('git' 'make')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/Hyprdots-ctl"
    make DESTDIR="$pkgdir" all
}