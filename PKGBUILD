# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='naabu'
pkgname="${_pkgname}-bin"
pkgver=2.0.3
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
# arch=('x86_64' 'armv6h' 'aarch64')
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
# source_armv6h=("${_pkgname}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
# source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('b9d24ac3316e4dcbab17cef4e9aac7ae1ca7d0086cf671e6291bb9064a80edba')
# sha256sums_armv6h=('e8ec2204291c1ab572240ed9affbb913505737b7c156da2b4902c9a17206a2de')
# sha256sums_aarch64=('17e8abd73c8ebd56826809f38783c013bfcacda6a791866746e19fe27be56e77')

package() {
  install -Dvm755 "${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
