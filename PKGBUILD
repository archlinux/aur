# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=veridian-bin
_pkgname=veridian
pkgver=0.0.0
pkgrel=2
pkgdesc="A SystemVerilog Language Server "
arch=('x86_64')
url="https://github.com/vivekmalneedi/veridian"
license=('MIT')
provides=('veridian')
source=("https://github.com/vivekmalneedi/$_pkgname/releases/download/nightly/veridian-ubuntu-20.04.tar.gz")
sha256sums=('6f2ad6d2e50e5a481c93c98259463b7028b0a9a359f8a41189dfe17f078269f7')
optdepends=(
  'verible-bin: syntax checking and formatting (binary)'
  'verible: syntax checking and formatting'
  'verible-git: syntax checking and formatting (git version)'
)

package() {
    install -Dm755 "./veridian" "$pkgdir/usr/bin/veridian"
}

