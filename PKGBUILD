# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=yh-bin
_pkgname=yh
pkgver=0.4.0
pkgrel=1
pkgdesc="A YAML syntax highlighter for the CLI"
arch=('x86_64')
url="https://github.com/andreazorzetto/yh"
license=('Apache')
source=("${pkgname}-${pkgver}.zip::https://github.com/andreazorzetto/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('ec5df94b2b681da8a89b3039f8ca2814da1420e3e6750040634ba0c109e15ce9')

package() {
  install -Dm 755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
