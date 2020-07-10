#Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=send_email
pkgver=0.4.2
pkgrel=1
pkgdesc='Send emails in bare-bone environments with minimal requirements.'
arch=(any)
license=('MIT')
url="https://github.com/kgizdov/send_email.sh"
depends=('coreutils' 'bash' 'curl')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kgizdov/${pkgname}.sh/archive/v${pkgver}.tar.gz"
)
sha512sums=('b08af7f820b4899b3d116bbefd42542f25527b1883be9181f2beb47732f5dabee5fd2d8e59b84cd62113781d5a2a3fd64b04ffcac51024538d3e263767fdfbf9')
validpgpkeys=('4BE61D684CB4E31741614E7089AA27231C530226')

package () {
  cd "${srcdir}/${pkgname}.sh-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
