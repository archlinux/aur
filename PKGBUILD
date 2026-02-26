# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=dnose-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Dart Test Smell Detector"
arch=('x86_64')
url="https://github.com/tassiovirginio/dnose"
license=('MIT')
depends=('glibc')
provides=('dnose')
conflicts=('dnose')
source=("dnose-${pkgver}::https://github.com/tassiovirginio/dnose/releases/download/v${pkgver}/dnose_linux_amd64"
        "LICENSE::https://raw.githubusercontent.com/tassiovirginio/dnose/main/LICENSE")
sha256sums=('c0f0c73ca2a3572fabd94181fcabf3e3b2484447c773bdcb70faa6bb432033fe'
            '207765dc4908eeeb6fddc5aa9947796c27d9fe643c5160c74d0b28e7f52393f2')

package() {
  install -Dm755 "${srcdir}/dnose-${pkgver}" "${pkgdir}/usr/bin/dnose"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
