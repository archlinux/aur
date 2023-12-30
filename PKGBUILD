pkgname=hyprdots-ctl
pkgver=v0.2.0.7.23123014
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