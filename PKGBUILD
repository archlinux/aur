# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=veridian-bin
_pkgname=veridian
pkgver=0.0.0
pkgrel=3
pkgdesc="A SystemVerilog Language Server "
arch=('x86_64')
url="https://github.com/vivekmalneedi/veridian"
license=('MIT')
provides=('veridian')
source=("https://github.com/vivekmalneedi/$_pkgname/releases/download/nightly/veridian-ubuntu-20.04.tar.gz")
sha256sums=('260a35f7fe7c06a439431de8feb98f3bbd57884d9137bf84771c66596b6b6501')
optdepends=(
	'verible-bin: syntax checking and formatting (binary)'
	'verible: syntax checking and formatting'
	'verible-git: syntax checking and formatting (git version)'
)

package() {
	install -Dm755 "./veridian" "$pkgdir/usr/bin/veridian"
}
