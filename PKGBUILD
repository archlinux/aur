# Maintainer: Serhii Kovalyov <seryogakovalyov at gmail dot com>
pkgname=cue-normalize
pkgver=1.1.0
pkgrel=1
pkgdesc='Minimal Bash CLI to normalize and repair problematic CUE files'
arch=('any')
url='https://github.com/seryogakovalyov/cue-normalize'
license=('MIT')
options=(!debug)
depends=('bash' 'coreutils' 'findutils' 'gawk' 'grep' 'perl' 'file' 'sed')
optdepends=('uchardet: better encoding detection')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/seryogakovalyov/cue-normalize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('786e2e91369c2b39d3f0872a512b725b57a62e3fef77ddc10217dfdee75f68bf')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
