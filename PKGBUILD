# Maintainer: robertfoster
pkgname=grepai-bin
pkgver=0.24.1 # renovate: datasource=github-releases depName=yoanbernabeu/grepai
pkgrel=1
pkgdesc="Privacy-first CLI tool for semantic code search using vector embeddings"
arch=('x86_64' 'aarch64')
url="https://github.com/yoanbernabeu/grepai"
license=('MIT')
depends=('glibc')
provides=('grepai')
conflicts=('grepai' 'grepai-git')

package() {
  install -Dm755 "${srcdir}/grepai" "${pkgdir}/usr/bin/grepai"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/yoanbernabeu/grepai/releases/download/v${pkgver}/grepai_${pkgver}_linux_amd64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/yoanbernabeu/grepai/v${pkgver}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/yoanbernabeu/grepai/releases/download/v${pkgver}/grepai_${pkgver}_linux_arm64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/yoanbernabeu/grepai/v${pkgver}/LICENSE")
sha256sums_x86_64=('cb2a0529d96e43157a3800724a134410b61c6477e2691437b7aacc5495c04e6a'
                   '49966552514373129de9faea43a890bf6a8b04f158b2966876a57fdf915980e5')
sha256sums_aarch64=('cb2a0529d96e43157a3800724a134410b61c6477e2691437b7aacc5495c04e6a'
                    '49966552514373129de9faea43a890bf6a8b04f158b2966876a57fdf915980e5')
