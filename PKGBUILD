# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=tmux-sessionizer
pkgname=$_projectname-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A tool for opening git repositories as tmux sessions"
arch=("x86_64")
url="https://github.com/jrmoulton/tmux-sessionizer"
license=("MIT")
depends=("tmux")
provides=("$_projectname")
conflicts=("$_projectname")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_projectname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('210a63eeaaa11844f8341bd0929d7a6868d8aac47056a55a70d485f061429fda')

package() {
    cd "tmux-sessionizer-x86_64-unknown-linux-gnu"
    install -Dm 0755 tms $pkgdir/usr/bin/tms
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${_projectname}/LICENSE
}
