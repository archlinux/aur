# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://sr.ht/~statianzo/PKGBUILD-cloud66-toolbelt

pkgname=cloud66-toolbelt
pkgver=0.1.111
pkgrel=1
pkgdesc='Cloud66 Toolbelt'
url='https://help.cloud66.com/toolbelt/toolbelt-introduction'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("http://downloads.cloud66.com/cx/cx_${pkgver}_linux_amd64.tar.gz")
md5sums=('650a7a9de735bf9a11c522c1554fac4e')
sha256sums=('66f955d540df3faeaeb7d9703829b3bc4bd74593874bd3845238360040b33a8d')

package() {
  cd "${srcdir}/cx_${pkgver}_linux_amd64/"
  install -D -m755 "cx"                "${pkgdir}/usr/bin/cx"
}
