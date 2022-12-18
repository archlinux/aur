# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.8.3
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
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('f35a167c00b9a6e6eb5cdd04afe410e045c7148115a9eddd5bd4f425a2dab087014ca97b8975ca4af3eb23705410b465d83c4f791e998470a444b87bc6cab9f1')
b2sums_x86_64=('df6250a35db17f83f3f4917ac0e1cf04afb97e09edb47d86b2aab1c811ab5948c58c4fb573de666f383834d35751ef0ce0b01aa1eef5e2b41d248d8d31cb2b4d')
b2sums_armv6h=('37f68b1e257eb09846a6935f801f63fd7c92ff274ae5ba4e8233a79d84ff22c917ada7399ee43d28df1e65cb17469a0e15a8d915631d9c9578d6403f37fccecd')
b2sums_aarch64=('bcea3ec6c3b9fdca3b4fb4dbf6972fc90fb4f99159aeec4cf4c470a3881397a946d409e50716f65892174b55b6e73fa166a8b5a8cfe3cd33c8c01db5ada91322')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
