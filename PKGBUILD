#Maintainer: Konstantin Gizdov <arch at kge dot pw>
pkgname=send_email
pkgver=0.4.5
pkgrel=1
pkgdesc='Send emails in bare-bone environments with minimal requirements.'
arch=(any)
license=('MIT')
url="https://github.com/kgizdov/send_email.sh"
depends=('coreutils' 'bash' 'curl')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kgizdov/${pkgname}.sh/archive/v${pkgver}.tar.gz"
)
sha512sums=('285dca2d53c57f660498fc6ae9a6d29cb0ebf80447f1bd56623d6400a088d42d59405eb5f7acf6087bc23de911ed3e82efb8529793b99c9e19b35e969a289f82')
validpgpkeys=('4BE61D684CB4E31741614E7089AA27231C530226')

package () {
  cd "${srcdir}/${pkgname}.sh-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
