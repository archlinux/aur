pkgname=hyprdots-ctl
pkgver=v0.2.0.46.24020600
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/Hyprdots-ctl"
    make DESTDIR="$pkgdir" clean all
}