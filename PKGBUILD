# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=paperlessmerge-bin
pkgver=0.1.2
pkgrel=2
pkgdesc='PaperlessMerge can easily merge documents in paperless-ng(x)'
arch=('x86_64')
url="https://github.com/Marco98/paperlessmerge"
license=('MIT')
source=(
  "https://github.com/Marco98/paperlessmerge/releases/download/v${pkgver}/paperlessmerge_${pkgver}_linux_amd64"
  "https://raw.githubusercontent.com/Marco98/paperlessmerge/v${pkgver}/LICENSE"
)
sha256sums=('3550be038cb5af8b6e7b8c6a184a5d2bb7f6b66ff7c70aee4d147ce8b343bc23'
            'e5a861367544ac0b354e8d097eac039c150895705b4447fb8af366e35c63dacc')

package() {
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "${srcdir}/paperlessmerge_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/paperlessmerge"
}

