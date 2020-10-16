# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='credhub-cli'
pkgname="${_pkgname}-bin"
pkgver=2.9.0
pkgrel=1
pkgdesc='Command line interface to interact with CredHub servers'
arch=('x86_64')
url='https://github.com/cloudfoundry-incubator/credhub-cli'
license=('APACHE')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/${pkgver}/${_pkgname%-*}-linux-${pkgver}.tgz"
        "${_pkgname}-${pkgver}-README.md::${url}/raw/${pkgver}/README.md")
sha256sums=('f260e926099f9eb9474ab2239851e391bfd0fd1354a52891f3c834cea1630e8a'
            'aa40390b768654ea0253da2034c97225f8d343af13a19c16e28fac1b69d567c6')

package() {
  install -Dvm755 "${_pkgname%-*}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
