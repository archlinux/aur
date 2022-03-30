# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=veridian-bin
_pkgname=veridian
pkgver=0.0.0
pkgrel=1
pkgdesc="A SystemVerilog Language Server "
arch=('x86_64')
url="https://github.com/vivekmalneedi/veridian"
license=('MIT')
provides=('veridian')
source=("https://github.com/vivekmalneedi/$_pkgname/releases/download/nightly/veridian-ubuntu-20.04.tar.gz")
sha256sums=('925cbef6b672b657c3bd278c91437537c827f3e1eccd607f9ea28b91f238faa5')
optdepends=(
  'verible-bin: syntax checking and formatting (binary)'
  'verible: syntax checking and formatting'
  'verible-git: syntax checking and formatting (git version)'
)

package() {
    install -Dm755 "./veridian" "$pkgdir/usr/bin/veridian"
}

