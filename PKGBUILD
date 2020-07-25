#Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=send_email
pkgver=0.4.3
pkgrel=1
pkgdesc='Send emails in bare-bone environments with minimal requirements.'
arch=(any)
license=('MIT')
url="https://github.com/kgizdov/send_email.sh"
depends=('coreutils' 'bash' 'curl')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kgizdov/${pkgname}.sh/archive/v${pkgver}.tar.gz"
)
sha512sums=('a8fbd08b64ad383c0bbfc946c29edc75b3e8dfddc03982373be6bc836f9dc43449bc719cabb37e819043880c8318b2e0d31e7716b642a8f01e4d5ccd34cb6482')
validpgpkeys=('4BE61D684CB4E31741614E7089AA27231C530226')

package () {
  cd "${srcdir}/${pkgname}.sh-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
