# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='cloudlist'
pkgname="${_pkgname}-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc='Tool for listing Assets from multiple Cloud Providers'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/cloudlist'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('c18d429c38d4259bebd3d59b4c6d0ed94d019c0c1a35e107abdd4b81d40ef9e8')
sha256sums_armv6h=('5549c73ac598932f8437e5cc2dbce5ad63c8e479471b518eb4d7ec1011c23b3b')
sha256sums_aarch64=('49a4dabc3e0628eccedcd1e1de54c7196638e1019f3981b7e7f1f9afac8aaaa9')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
