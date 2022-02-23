# Maintainer: Gleb Buzin <qufiwefefwoyn@gmail.com>

pkgname=reflex-bin
_pkgname=reflex
_author=cespare
pkgver=0.3.1
pkgrel=1
pkgdesc="Run a command when files change"
url="github.com/$_author/$_pkgname"
depends=('glibc')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_author}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
sha512sums=('48e34197049c3185c7f01524de1b1ee00505167c722943f4167f4b6dfd97956211143e31c1258edb26a3616e417792d581e64727c62ff0889aefe36ae63e0317')

package() {
  cd "${_pkgname}_linux_amd64"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
