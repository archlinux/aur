# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=flintc-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Flint programming language compiler and language server"
arch=('x86_64')
url="https://github.com/flint-lang/flintc"
license=('MIT')

source=(
	"https://github.com/flint-lang/flintc/releases/download/v${pkgver}-core/flintc"
	"https://github.com/flint-lang/flintc/releases/download/v${pkgver}-core/fls"
)
sha256sums=(
	'ef6108d15f242fd469b6b9528dc9d4be4ebd946574514c9137e33783fbfa5943'
	'7132224da447be86cb4908f88d175f420bb5c69b35ee24ed1db5a3dc993525bd'
)

package() {
	install -Dm755 flintc "${pkgdir}/usr/bin/flintc"
	install -Dm755 fls "${pkgdir}/usr/bin/fls"
}
