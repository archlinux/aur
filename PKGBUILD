# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=llama-bin
_pkgname=llama
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal file manager written in Go"
arch=('x86_64')
url="https://yktoo.com/en/software/ymuse/#software-downloads"
license=('MIT')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/antonmedv/llama/releases/download/v${pkgver}/llama_linux_amd64")
noextract=("llama_linux_amd64")
sha256sums=(
	"6fb879a0a4267fdb54ea190e14f32f815dcc4548dc042c8226e04ee5b33f4038")

package() {
	install -Dm755 llama_linux_amd64 "$pkgdir/usr/bin/$_pkgname"
}
