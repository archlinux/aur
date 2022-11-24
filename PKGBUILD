# Maintainer: Porta <portalmaster137@gmail.com>
pkgname="clrterm"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="honestly this is just a test"
arch=('x86_64')
url="https://github.com/portalmaster137/clrterm-arch-test"
_src_url="https://raw.githubusercontent.com/portalmaster137/clrterm-arch-test/main/clrterm.c"
_makefile="https://raw.githubusercontent.com/portalmaster137/clrterm-arch-test/main/Makefile"
license=(MIT)
#depends on base-devel
depends=(gcc)
source=($_src_url $_makefile)
sha256sums=('b4a2f7f3ded6796c5bb0c91c46dac69b8a87caccf7afb38410ac648f1a485eac' 'f013a528952107d181b683124a4f18dc6de05c3c62d6f0e1389500dd68739e58')
_archive

build() {
	make
}
package() {
	sudo install clrterm /usr/bin
}