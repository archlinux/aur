# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=veridian-bin
_pkgname=veridian
pkgver=0.0.0
pkgrel=4
pkgdesc="A SystemVerilog Language Server "
arch=('x86_64')
url="https://github.com/vivekmalneedi/veridian"
license=('MIT')
provides=('veridian')
source=("https://github.com/vivekmalneedi/$_pkgname/releases/download/nightly/veridian-ubuntu-20.04.tar.gz")
sha256sums=('163f0140813b34c759ad38d75aec7292da6a2e1ad334e1a79d8843d134985871')
optdepends=(
	'verible-bin: syntax checking and formatting (binary)'
	'verible: syntax checking and formatting'
	'verible-git: syntax checking and formatting (git version)'
)

package() {
	install -Dm755 "./veridian" "$pkgdir/usr/bin/veridian"
}
