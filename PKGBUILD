# Maintainer: Jason Staten <jstaten07 gmail>
pkgname=cloud66-toolbelt
pkgver=0.1.9
pkgrel=1
pkgdesc='Sauce Connect untility for Sauce Labs testing'
url='http://help.cloud66.com/toolbelt/introduction.html'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("http://downloads.cloud66.com/cx/cx_${pkgver}_linux_amd64.tar.gz")

package() {
  cd "${srcdir}/cx_${pkgver}_linux_amd64/"
  install -D -m755 "cx"                "${pkgdir}/usr/bin/cx"
}
sha256sums=('95fe9718b318608a2ae6df8f42a44dc739b9c8b5744d600d77d429ee1ed4132a')
md5sums=('473fd5a3b9e1499a8ed95b2b37f8075b')
