# Maintainer: zwielichtig <zwielichtig@users.noreply.github.com>
pkgname=zorg-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='A TUI SSH connection manager and orchestrator'
arch=('x86_64')
url='https://github.com/Zwielichtig/zorg'
license=('GPL-3.0-only')
provides=('zorg')
conflicts=('zorg')
source=(
  "zorg-${pkgver}::https://github.com/Zwielichtig/zorg/releases/download/zorg-v1.4.0-proxyjump-part-2/zorg"
  "LICENSE::https://raw.githubusercontent.com/Zwielichtig/zorg/refs/tags/zorg-v1.4.0-proxyjump-part-2/LICENSE.md"
)
b2sums=(
  'bcca1e864c038a92ca5a6799840b191a87733ed4592c6dc43d1aa2e9d1225389e38e98138d3feb37bd1e1ea84d2ba3b43f0193d4b4c5fa8927a7893389823e89'
  '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
)

package() {
  install -Dm0755 "zorg-${pkgver}" "${pkgdir}/usr/bin/zorg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
