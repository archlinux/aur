# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://sr.ht/~statianzo/PKGBUILD-cloud66-toolbelt

pkgname=cloud66-toolbelt
pkgver=0.1.63
pkgrel=1
pkgdesc='Cloud66 Toolbelt'
url='https://help.cloud66.com/toolbelt/toolbelt-introduction'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("http://downloads.cloud66.com/cx/cx_${pkgver}_linux_amd64.tar.gz")
md5sums=('dc1a2f1f917ff71a156974d25783cf8a')
sha256sums=('202655d87452c1bb21a672036fcdd6a501ec6dfb9cff4c004848018c91104192')

package() {
  cd "${srcdir}/cx_${pkgver}_linux_amd64/"
  install -D -m755 "cx"                "${pkgdir}/usr/bin/cx"
}
