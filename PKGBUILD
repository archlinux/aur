# Maintainer: necklace <ns@nsz.no>

pkgname=harfbuzz-bin-2.9.1
pkgver=2.9.1
pkgrel=1
provides=('harfbuzz-2.9.1')
pkgdesc='HarfBuzz text shaping engine'
arch=('x86_64')
license=('MIT')
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"

source=(
  "https://archive.archlinux.org/packages/h/harfbuzz/harfbuzz-2.9.1-1-x86_64.pkg.tar.zst"
)

sha256sums=(
  '226bcc89e828cc2ca91233cf622721a0c129308e34a974c42a2afed8257b09de'
)

package() {
  mkdir -p "${pkgdir}/usr/lib/"
  install -Dm755 "${srcdir}/usr/lib/libharfbuzz-subset.so.0.20901.0" "${pkgdir}/usr/lib/"
  install -Dm755 "${srcdir}/usr/lib/libharfbuzz.so.0.20901.0" "${pkgdir}/usr/lib/"
}
