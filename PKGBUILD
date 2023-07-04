# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>

_name=square
pkgname=ttf-${_name}
pkgver=1
pkgrel=1
pkgdesc='Font intended for roguelike games'
url="https://strlen.com/${_name}/"
arch=(any)
license=('CCPL:by')
source=("https://strlen.com/files/${_name}.ttf")
b2sums=('b6ce1702e46b1270477344d5f37a384c64f2336ff941871f0f1af93fb53c6a893332df2397a04d5687c36c1de6e60d7f30d38f39267debbadd56cebc5152d43d')

package() {
  install -Dm644 "${_name}.ttf" -t "$pkgdir/usr/share/fonts/TTF"
}

