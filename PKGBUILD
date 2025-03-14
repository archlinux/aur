# Maintainer:  Richard Murri <richardmurri@gmail.com>

_pkgname="meeters"
pkgname="${_pkgname}-bin"
pkgver=1.6.2
pkgrel=1
pkgdesc="Watches an ical calendar file URL and will notify shortly before a meeting begins"
arch=('x86_64' 'i686')
url="https://github.com/aggregat4/${_pkgname}"
license=('Apache-2.0')
depends=('libappindicator-gtk3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-v${pkgver}"
source_i686=("${_pkgsrc}-linux-x86.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86.tar.gz")
sha256sums_i686=('b29fae7ba090c29c9b77fb032d9151fe90d130dc2c70ca750b09e3d11f9495a1')
source_x86_64=("${_pkgsrc}-linux-x86.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86.tar.gz")
sha256sums_x86_64=('b29fae7ba090c29c9b77fb032d9151fe90d130dc2c70ca750b09e3d11f9495a1')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  # install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
