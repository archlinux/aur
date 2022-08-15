# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=guess-that-lang-bin
pkgver=1.0.16
pkgrel=1
pkgdesc='CLI game to see how fast you can guess the language of a code block! '
arch=(x86_64)
url='https://github.com/Lioness100/guess-that-lang'
license=('Apache-2.0')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("${url}/releases/download/v${pkgver}/guess-that-lang_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("9ee4cd64303d4f92e3b4d29022df5a48b6c3bc589836e1d9a96fc9d0779eeb73")

package() {
  install -Dm755 guess-that-lang "${pkgdir}/usr/bin/guess-that-lang"
}
