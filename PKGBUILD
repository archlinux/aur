# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=gitui-bin
pkgver=0.10.0
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

sha256sums=('2d2a1b2b46fb00c657cf43dc24a2c5049d706109e5813d7f0ad3d882527b699c')
