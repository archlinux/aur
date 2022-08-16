# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=guess-that-lang-bin
pkgver=1.0.18
pkgrel=1
pkgdesc='CLI game to see how fast you can guess the language of a code block! '
arch=(x86_64)
url='https://github.com/Lioness100/guess-that-lang'
license=('Apache-2.0')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("${url}/releases/download/v${pkgver}/guess-that-lang_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("3ed9a7bf597b11aeef405d52e6f6345ea44c53d835bd262337335439c8e31b1f")

package() {
  install -Dm755 guess-that-lang "${pkgdir}/usr/bin/guess-that-lang"
}
