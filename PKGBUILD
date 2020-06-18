# Maintainer: Aztec Rabbit <ars.xda@gmail.com>

pkgname=brainfuck-psiphon-pro-go-bin
pkgver=1.3.200512
pkgrel=1
pkgdesc="Brainfuck Tunnel [Psiphon Pro Go Version. ${pkgver}]"
arch=('x86_64')
url='https://github.com/aztecrabbit/brainfuck-psiphon-pro-go'
license=('MIT')
conflicts=('brainfuck-psiphon-pro-go-git')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/aztecrabbit/brainfuck-psiphon-pro-go/releases/download/${pkgver}/brainfuck-psiphon-pro-go-${pkgver}.tar.gz"
)
md5sums=(
	'4a2a2685e0fb8f2efcd13dff7e87bdf7'
)

package() {
	mkdir -p "$pkgdir/usr/bin"
	ln -sf "${srcdir}/brainfuck-psiphon-pro-go" "$pkgdir/usr/bin/brainfuck-psiphon-pro-go"
}
