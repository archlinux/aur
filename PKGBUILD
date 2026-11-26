# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arcmd-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Native Markdown editor with a rich-text canvas"
arch=('x86_64' 'aarch64')
url="https://github.com/Ciao1019/ArcMD"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/arcmd-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/arcmd-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('66d427b182f0d7fa367b046272c4dbda231e563c2c7924a3a710b8b34ddba137')
sha256sums_aarch64=('6a2b8909f6cb62c4e70e3c64ee41fbd14e9e04bb49899cfeb5fa8f6560eb2cc6')

package() {
  install -Dm755 "arcmd" "${pkgdir}/usr/bin/arcmd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/bot-avatars/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/cra/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/katex/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/kokonutui/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/lobe-streaming/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/mygo-native-ui/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/opensourceui/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/quiet-md/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/textus/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
