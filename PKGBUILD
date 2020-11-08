# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://sr.ht/~statianzo/PKGBUILD-cloud66-toolbelt

pkgname=cloud66-toolbelt
pkgver=0.1.95
pkgrel=1
pkgdesc='Cloud66 Toolbelt'
url='https://help.cloud66.com/toolbelt/toolbelt-introduction'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("http://downloads.cloud66.com/cx/cx_${pkgver}_linux_amd64.tar.gz")
md5sums=('3f0cc0ee3c32b6bf05ac72af169e57b6')
sha256sums=('a5e417e0b17beae013ff46bdcb34fea618db5ca5b6d395517c118266c8d9c33e')

package() {
  cd "${srcdir}/cx_${pkgver}_linux_amd64/"
  install -D -m755 "cx"                "${pkgdir}/usr/bin/cx"
}
