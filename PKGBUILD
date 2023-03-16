# Maintainer: Kyrill Belomenov <kyrill.belomenov>

_pkgname="rock-paper-scissor"
pkgname="${_pkgname}-git"
pkgver=1.0
pkgrel=1
pkgdesc="an rock paper scissor game for linux"
arch=('any')
url="https://github.com/kybe236/rock-paper-scissor"
license=('MIT')
depends=("python")
makedepends=('git')
source=('git+https://github.com/kybe236/rock-paper-scissor.git')
md5sums=('SKIP')


package() {
  cd "${_pkgname}"
  install -Dvm755 "main.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}-git/LICENSE"
}