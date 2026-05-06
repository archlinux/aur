# Maintainer: zwielichtig <zwielichtig@users.noreply.github.com>
pkgname=zorg-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='A TUI SSH connection manager and orchestrator'
arch=('x86_64')
url='https://github.com/Zwielichtig/zorg'
license=('GPL-3.0-only')
provides=('zorg')
conflicts=('zorg')
source=(
  "zorg-${pkgver}::https://github.com/Zwielichtig/zorg/releases/download/zorg-v${pkgver}/zorg"
  "LICENSE::https://raw.githubusercontent.com/Zwielichtig/zorg/refs/tags/zorg-v${pkgver}/LICENSE.md"
)
b2sums=(
  '1f540d14dd93023022697d3650d7a92db0ed406ddd177b63da7cbf9c660bd0030c6f5d7c921a8e87a54f2109ebe7a38e45dd608851d20a6a5376a3499eb54fad'
  '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
)

package() {
  install -Dm0755 "zorg-${pkgver}" "${pkgdir}/usr/bin/zorg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
