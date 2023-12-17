pkgname=hyprdots-ctl
pkgver=v0.1.0.58
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('unknown') # Soon
depends=( 'fzf' 'tree' )
makedepends=('git' 'make' 'curl')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/Hyprdots-ctl"
    make DESTDIR="$pkgdir" all
}