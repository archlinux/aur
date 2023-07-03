# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.9.8
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('f35a167c00b9a6e6eb5cdd04afe410e045c7148115a9eddd5bd4f425a2dab087014ca97b8975ca4af3eb23705410b465d83c4f791e998470a444b87bc6cab9f1')
b2sums_x86_64=('fcfd3f044488d3d13cee52fc23bc6463c3ad2ae6aede7f27835b7683d599ac60c169e4d3b477142c89bd11fe7ca8db1a0a43e94e47bdb6893a72cbbcfd6dc099')
b2sums_armv6h=('740af5dbf6b85555232753894d4d7049d4de360b6c9773da06e5051b5f2433cc3bd819e724196a4780d555a648bfde211fda554e5174996e09cda17a5f7836d4')
b2sums_aarch64=('e1414c1400883a8d6682de3199099638bad64608effe3685d0fb9652b44b5df444f59d9311d948d76e58d166a3209d038a78103d8550caecfccddb3e850a1a2f')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
