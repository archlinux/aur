# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=yh-bin
_pkgname=yh
pkgver=0.2.1
pkgrel=1
pkgdesc="A YAML syntax highlighter for the CLI"
arch=('x86_64')
url="https://github.com/andreazorzetto/yh"
license=('Apache')
source=("https://github.com/andreazorzetto/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('e98007a2c3f0a968fd5de479b1a32c0199bd40e862cd8b7f4e6a2edb3dfa6720')

package() {
  install -Dm 755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
