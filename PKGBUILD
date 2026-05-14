# Maintainer: Serhii Kovalyov <seryogakovalyov at gmail dot com>
pkgname=cue-normalize
pkgver=1.0.1
pkgrel=1
pkgdesc='Minimal Bash CLI to normalize and repair problematic CUE files'
arch=('any')
url='https://github.com/seryogakovalyov/cue-normalize'
license=('MIT')
options=(!debug)
depends=('bash' 'coreutils' 'findutils' 'gawk' 'grep' 'perl' 'file' 'sed')
optdepends=('uchardet: better encoding detection')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/seryogakovalyov/cue-normalize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19235d217578ed437988172d5fd4f22dbf8a76ae5a1370cb9709a04ef85c4865')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
