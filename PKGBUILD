# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arcmd-bin
pkgver=0.5.0
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
sha256sums_x86_64=('7ec772be0973115840b8641283d92503b94651cba914d0638605209e30f5d573')
sha256sums_aarch64=('0cbad646662137ea5846715dbe7ed75d4d2048618656827eb3173f763dae883f')

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
