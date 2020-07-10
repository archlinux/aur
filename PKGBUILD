#Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=send_email
pkgver=0.4.1
pkgrel=1
pkgdesc='Send emails in bare-bone environments with minimal requirements.'
arch=(any)
license=('MIT')
url="https://github.com/kgizdov/send_email.sh"
depends=('coreutils' 'bash' 'curl')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kgizdov/${pkgname}.sh/archive/v${pkgver}.tar.gz"
)
sha512sums=('636cf676448a7a330831237f9ac1910a069ee5194a21c1df548d9c78e5da4cef28bf9ca99d44d4f713a48cdd321a5abd6eb6155599bf49ec0a69490fe42707ec')
validpgpkeys=('4BE61D684CB4E31741614E7089AA27231C530226')

package () {
  cd "${srcdir}/${pkgname}.sh-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
