# Maintainer: Faiz Hasan <faiz at kopi dot pp dot ua>
pkgname=tosutil-bin
_pkgname=tosutil
pkgver=3.1.4
pkgrel=1
pkgdesc="Tosutil is a command-line tool for accessing and managing BytePlus Torch Object Storage (TOS)."
depends=()
arch=('x86_64')
source=(https://tos-tools.tos-ap-southeast-1.bytepluses.com/linux/amd64/tosutil)
sha256sums=(00b50507d7530cc073ed607a03cc578312a192709e34795bc8176d0d1ef60cde)

package(){
  install -D -m 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}