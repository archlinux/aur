# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
# Contributor: Noah Vogt <noah@noahvogt.com>

pkgname=veridian-bin
pkgver=0.0.0
pkgrel=5
pkgdesc="A SystemVerilog Language Server"
arch=('x86_64')
url="https://github.com/vivekmalneedi/${pkgname%-*}"
license=('MIT')
provides=('veridian')
source=("$url/releases/download/nightly/${pkgname%-*}-ubuntu-22.04.tar.gz")
sha256sums=('ec4c25b8a2d0bde4a755555160d9ff47df5d9e9d034935cea658189f4be578a0')
optdepends=(
	'verible-bin: syntax checking and formatting (binary)'
	'verible: syntax checking and formatting'
	'verible-git: syntax checking and formatting (git version)'
)

package() {
	install -Dm755 "./${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
}
