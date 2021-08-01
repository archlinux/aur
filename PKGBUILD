# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.4.2
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/master/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb')
sha256sums_x86_64=('5d3df9dca3377c3d226d911b3110067a9fd163a7f53e887532be1d5df530c89e')
sha256sums_armv6h=('4bd7495f502d14631abbb93e7fb14bec0131e304773c364ad34de8f1c850dccd')
sha256sums_aarch64=('c3e9abbda53d0f3118113af4c8a1f3bc9d9c4ea7b0df3fe4f167649873113646')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
