# Maintainer: Adrian Zankich <azankich@pivotal.io>
pkgname=vendir-bin
pkgdesc="Easy way to vendor portions of git repos, github releases, etc. declaratively "
pkgver=0.8.0
pkgrel=2
url="https://github.com/k14s/vendir"
arch=('x86_64')
license=('apache')
groups=('k14s-bin')
provides=('vendir')
conflicts=('vendir')
_binary=vendir-linux-amd64
source=("${_binary}-v${pkgver}::https://github.com/k14s/vendir/releases/download/v${pkgver}/${_binary}")
sha256sums=("6a9afd04835020b0901c19991f138e293be99d755a5db15bed8b4dfe34920c17")

package() {
  install -Dm 755 "${srcdir}/${_binary}-v${pkgver}" "${pkgdir}/usr/bin/vendir"
}
