# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.10
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('797ff39a59e418911721bcc07868bd6e7b5c8f120d1b4506b6ec10d8639b90b398b07a924b1fa7aaeab83d66b3413c0f955023c37449cead35d2823e4e954faf')
b2sums_x86_64=('f3bb6c45f54546367d86067922a7fbe067673b9100761ef4244d8a6d3212fcfb21efa36f51cfcfe9698dea0a09c4d2345dd35d6ac3c81c0027d6850925f028e7')
b2sums_armv7h=('d9c8f07ff10240db1a0c573450f4bbc4c2cb7b2af740b8b8887edbd52a49263cdc3b036c1cfe49c391d60113c642774376aab7b8c7c81a44bb789b4c9803f0a2')
b2sums_aarch64=('abbb08d4545b1f69918f40f179127e4b661d560d9c4d498fe972197e7c1252460c116e2e5f62a5a379f2f0de4ca50483922b695cf85b7f5384d0f5ce3bb30537')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
