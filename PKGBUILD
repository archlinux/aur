# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='Blazing fast terminal-ui for git written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/extrawurst/gitui"
license=('MIT')
depends=('libgit2')
provides=("gitui")
conflicts=('gitui' 'gitui-git')
source=(
  https://github.com/dotiful/AUR/raw/master/gitui-bin/gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst
)
noextract=(gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst)
package() {
  tar -I zstd -xvf $srcdir/gitui-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst -C $pkgdir --exclude=".*"
}

sha256sums=('2cb124204bc8a4b6d1af6c79d66caf934061953f984cac0eb5bbe5abc91cea63')
