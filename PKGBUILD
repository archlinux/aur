#Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=send_email
pkgver=0.4.4
pkgrel=1
pkgdesc='Send emails in bare-bone environments with minimal requirements.'
arch=(any)
license=('MIT')
url="https://github.com/kgizdov/send_email.sh"
depends=('coreutils' 'bash' 'curl')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kgizdov/${pkgname}.sh/archive/v${pkgver}.tar.gz"
)
sha512sums=('525d790404966368a07e974a338c5f74bbbaf4fdafbc576cf8cc4b89e8b65a082d3cccfcf9b9a28dd9f1d7befd0a2217af1ad6ee5d1fbfe9129f1033ce553a5f')
validpgpkeys=('4BE61D684CB4E31741614E7089AA27231C530226')

package () {
  cd "${srcdir}/${pkgname}.sh-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
