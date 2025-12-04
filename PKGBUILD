# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.6.0
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
b2sums_i686=('8b10373f18c897f9a8593884b0ccf42731212ee008dc19a6cbe6e7785d28c435400f7d74b663e41e28a5471274a8f64f13554669513e8f43b10b9fd1268f4e91')
b2sums_x86_64=('d01c15eadbc4009df13dc382ac07a69c53618768ea0eb50f86022476b4d8133ba8dc85242c0f7110cea3d10ddd2d129dd1245b57dc28090a2f314ff41d7d63ee')
b2sums_armv7h=('b7c3f319d5ed21955726b122b0e565aac5c9624c0d3488bd4faccd23ee8ef9d20301d8017db16585246763077ee3feb5fbcbc57a99b921d607a7af6b094f459c')
b2sums_aarch64=('7c67704bbf5da7a8e518efbfb0c0be43d1e7d85a70edfbc3c40a24cd9c191ab0c57ac2ec55a7378514f1a62ac38fb139c09cd3d85ba2e11bb07bee63450548f0')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
