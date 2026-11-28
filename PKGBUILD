# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=luxir-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast search engine"
arch=('x86_64')
url="https://github.com/luxir-search/luxir"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/luxir-${pkgver}-linux-x86_64-v2.tar.gz")
sha256sums_x86_64=('26d010e83489d4d735ad4a44c110bb86f560c9534e01bf2ba32f53b5e0fd6327')

package() {
  install -Dm755 "luxir-${pkgver}-linux-x86_64-v2/luxir" "${pkgdir}/usr/bin/luxir"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/licenses/FastPFOR/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/licenses/hpp-proto/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/licenses/is_utf8/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/licenses/runtime/gcc/COPYING.RUNTIME" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/licenses/runtime/gcc/COPYING3" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/licenses/uni-algo/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "luxir-${pkgver}-linux-x86_64-v2/docs/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
