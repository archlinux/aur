# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=guess-that-lang-bin
pkgver=1.0.17
pkgrel=1
pkgdesc='CLI game to see how fast you can guess the language of a code block! '
arch=(x86_64)
url='https://github.com/Lioness100/guess-that-lang'
license=('Apache-2.0')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("${url}/releases/download/v${pkgver}/guess-that-lang_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("594b68068fa17036adf5cb346d55bec5f22cdb48adbf11dbf8e264ce39ce91a7")

package() {
  install -Dm755 guess-that-lang "${pkgdir}/usr/bin/guess-that-lang"
}
