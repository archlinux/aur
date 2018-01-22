# Maintainer: Jason Staten <jstaten07 gmail>
# PKGBUILD Source: https://github.com/statianzo/PKGBUILD-cloud66-toolbelt

pkgname=cloud66-toolbelt
pkgver=0.1.54
pkgrel=1
pkgdesc='Cloud66 Toolbelt'
url='https://help.cloud66.com/toolbelt/toolbelt-introduction'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("http://downloads.cloud66.com/cx/cx_${pkgver}_linux_amd64.tar.gz")
md5sums=('553004e455941138197c55a6475b0d96')
sha256sums=('6175ba2dd484776cfb74f79f7f6dabff3e51f4ac6335655115df8e09d7a81918')

package() {
  cd "${srcdir}/cx_${pkgver}_linux_amd64/"
  install -D -m755 "cx"                "${pkgdir}/usr/bin/cx"
}
