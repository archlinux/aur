# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='List of utilities for the daily developer workflow'
arch=('x86_64')
url="https://github.com/beatlabs/ergo"
license=('BSD')
provides=('ergo')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/ergo-${pkgver}-linux-amd64"
    'LICENSE::https://raw.githubusercontent.com/beatlabs/ergo/master/LICENSE')
sha256sums=('f585abc304683269c1650fdd86c934e062d25674c83264c78deee26229ab77f9'
            '39ce0a4556170ecaa5aca48fd0327bbfc022bc6b5e2f4074ca26b24009f6fd1c')

package() {
  install -Dm755 "${srcdir}"/ergo* "${pkgdir}/usr/bin/ergo"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
