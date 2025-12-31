# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.6.2
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
b2sums_i686=('b2f502c73e4079cd4e44b72431c8805d9939dd2b738b1399a532b0ffc4de8bc9c778cacb53642cfa76f529bbf415b09da996fa89eaab49757237641339e8a683')
b2sums_x86_64=('cf3982702d15a92a0328b76bb09444c5d36c02d159d61e605bac2eff0befc2e67624ee9cc97d254525b5575cecc6ea8795c20573ffa62fea4ad9928286b14b38')
b2sums_armv7h=('2bbcf9bddb90361713651f297664d82e9d628a1511cf55065619b0cbd872684a358ab085db9f4c9f987a4163c9441bcd76b6680ff425b5a174550672e8306f7d')
b2sums_aarch64=('bfab8ab6a7550607f1c0b5137505f0f691bc2b7b071fc46ba1394cd8a98db91fc3b9daae73a34b1c0df54c881796211a39907968beb71126df2bcbbaa6cf698f')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
