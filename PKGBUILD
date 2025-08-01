# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=tmux-sessionizer
pkgname=$_projectname-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool for opening git repositories as tmux sessions"
arch=("x86_64")
url="https://github.com/jrmoulton/tmux-sessionizer"
license=("MIT")
depends=("tmux")
provides=("$_projectname")
conflicts=("$_projectname")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_projectname-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('647699c2369f2e739eda610e41013da0b87af9421f8393d7982e630efc2094a0910ca4e33c491af49b116171e18ae5b20d2a2caa76c2eb5349de64bdb427cabd')

package() {
    cd "tmux-sessionizer-x86_64-unknown-linux-gnu"
    install -Dm 0755 tms $pkgdir/usr/bin/tms
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${_projectname}/LICENSE
}
