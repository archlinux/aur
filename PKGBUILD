# Maintainer: A Frederick Christensen <aur@nosocomia.com>

pkgname=phosh-contacts-importer
_pkgname=contacts-importer
pkgver=1.0
pkgrel=1
pkgdesc="VCF Contact Importer for Phosh Phone Shell Interface"
arch=('aarch64')
url="https://puri.sm/posts/easy-librem-5-app-development-contacts-importer/"
license=('CC-BY-SA')
depends=('syncevolution')
source=("${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('9024536a5e7f0ba8aa9d2f4fdda6b73bc06374db4e3478c5d2f4a945236fff75'
            '257f30eee3b928f2916fc43c1d45fd9c0c340286f7f933069cce3fb1d52a6f7f')

package() {
  install -Dm755 "${_pkgname}.sh"      "${pkgdir}/usr/bin/${_pkgname}.sh"
  install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
