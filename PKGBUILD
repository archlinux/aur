# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=vim-to-github
pkgver=1.0.2
pkgrel=1
pkgdesc="Will take you from Vim to GitHub"
arch=("any")
url="https://github.com/tonchis/vim-to-github"
license=("MIT")
source=("https://github.com/tonchis/vim-to-github/archive/v$pkgver.tar.gz")
sha256sums=("afe12efe7369d32c547cf76784c80f795bea82e8a1dc1d1ff72581edd9cb11d7")

package() {
  install -Dm 644 \
    "$srcdir/vim-to-github-$pkgver/plugin/to-github.vim" \
    "$pkgdir/usr/share/vim/vimfiles/plugin/to-github.vim"
}
