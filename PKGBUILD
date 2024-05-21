# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
# Contributor: Noah Vogt <noah@noahvogt.com>

pkgname=veridian-bin
pkgver=0.0.0
pkgrel=6
pkgdesc="A SystemVerilog Language Server"
arch=('x86_64')
url="https://github.com/vivekmalneedi/${pkgname%-*}"
license=('MIT')
provides=('veridian')
source=("$url/releases/download/nightly/${pkgname%-*}-ubuntu-22.04.tar.gz")
sha256sums=('SKIP')
optdepends=(
	'verible-bin: syntax checking and formatting (binary)'
	'verible: syntax checking and formatting'
	'verible-git: syntax checking and formatting (git version)'
)

package() {
	install -Dm755 "./${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
}
