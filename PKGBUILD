# Maintainer:  Richard Murri <richardmurri@gmail.com>

_pkgname="meeters"
pkgname="${_pkgname}-bin"
pkgver=1.8.0
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
source_x86_64=("${_pkgsrc}-linux-x86.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86.tar.gz")
sha256sums_x86_64=('bc410e2fc2794d9ad552a944dac6e4a9b972f93e5700c31d76c21a6bdf533ebf')
sha256sums_i686=('bc410e2fc2794d9ad552a944dac6e4a9b972f93e5700c31d76c21a6bdf533ebf')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  # install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
