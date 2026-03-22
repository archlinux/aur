# Maintainer: Serhii Kovalyov <seryogakovalyov at gmail dot com>
pkgname=cue-normalize
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimal Bash CLI to normalize and repair problematic CUE files'
arch=('any')
url='https://github.com/seryogakovalyov/cue-normalize'
license=('MIT')
options=(!debug)
depends=('bash' 'coreutils' 'findutils' 'gawk' 'grep' 'perl' 'file' 'sed')
optdepends=('uchardet: better encoding detection')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/seryogakovalyov/cue-normalize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('946b855315c372c6cf5f27b6c7a836f4ec3dc66a75772003dcdfe17e04a1caff')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
