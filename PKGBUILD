# Maintainer: Michael

pkgname=harmonic
pkgver=0.2.1
pkgrel=2
pkgdesc="Retro-inspired desktop audio visualizer"
arch=('x86_64')
url="https://github.com/encor1/harmonic"
license=('MIT')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'hicolor-icon-theme'
  'desktop-file-utils'
)

install="${pkgname}.install"

source=(
  "${url}/releases/download/v${pkgver}/harmonic-linux-x86_64.tar.gz"
)

sha256sums=('0fab780aed1ac23c29aebc5b364ca126aea3fa8f7748d0776f45f758f168ec5b')

package() {
  install -Dm755 harmonic \
    "${pkgdir}/usr/bin/harmonic"

  install -Dm644 harmonic.desktop \
    "${pkgdir}/usr/share/applications/harmonic.desktop"

  install -Dm644 harmonic-256.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/harmonic.png"

  install -Dm644 harmonic-512.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/harmonic.png"
}
