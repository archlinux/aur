# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname="chaos-client-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc='Client to communicate with Chaos DNS API'
arch=('x86_64')
url="https://chaos.projectdiscovery.io/"
_githuburl='https://github.com/projectdiscovery/chaos-client'
license=('MIT')
provides=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums=('dc20ec21367051ca0608491703e564203ad2f59f85c4991370c1df70bd3ecc4a')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin" 
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}