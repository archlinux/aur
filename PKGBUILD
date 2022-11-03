# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=guess-that-lang-bin
pkgver=1.0.20
pkgrel=1
pkgdesc='CLI game to see how fast you can guess the language of a code block! '
arch=(x86_64)
url='https://github.com/Lioness100/guess-that-lang'
license=('Apache-2.0')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("${url}/releases/download/v${pkgver}/guess-that-lang_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("25d9689c7eccc1f51d2db9faf9e51328d94dc49f4243e1681be2e0189a4a1e5d")

package() {
  install -Dm755 guess-that-lang "${pkgdir}/usr/bin/guess-that-lang"
}
