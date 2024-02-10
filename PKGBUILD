# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=paperlessmerge-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='PaperlessMerge can easily merge documents in paperless-ng(x)'
arch=('x86_64')
url="https://github.com/Marco98/paperlessmerge"
license=('MIT')
source=(
  "paperlessmerge::https://github.com/Marco98/paperlessmerge/releases/download/v${pkgver}/paperlessmerge_${pkgver}_linux_amd64"
  "https://raw.githubusercontent.com/Marco98/paperlessmerge/v${pkgver}/LICENSE"
)
sha256sums=('859b84adcdd6e2e350c77b8288c8e9939d2330e91823a04b09de4e59fd577f82'
            'e5a861367544ac0b354e8d097eac039c150895705b4447fb8af366e35c63dacc')

package() {
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "${srcdir}/paperlessmerge" "${pkgdir}/usr/bin/paperlessmerge"
}

