# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=dnose-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Dart Test Smell Detector"
arch=('x86_64')
url="https://github.com/tassiovirginio/dnose"
license=('MIT')
depends=('glibc')
provides=('dnose')
conflicts=('dnose')
options=('!strip')
source=("dnose-${pkgver}::https://github.com/tassiovirginio/dnose/releases/download/v${pkgver}/dnose_linux_amd64"
        "LICENSE::https://raw.githubusercontent.com/tassiovirginio/dnose/main/LICENSE")
sha256sums=('febc6e1e1718ca7e0af6cc63eb5c9df028ef32f3963ecc92747d08f394593a97'
            '207765dc4908eeeb6fddc5aa9947796c27d9fe643c5160c74d0b28e7f52393f2')

package() {
  install -Dm755 "${srcdir}/dnose-${pkgver}" "${pkgdir}/usr/bin/dnose"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
