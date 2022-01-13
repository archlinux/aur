# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='List of utilities for the daily developer workflow'
arch=('x86_64')
url="https://github.com/beatlabs/ergo"
license=('BSD')
provides=('ergo')
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/ergo-${pkgver}-linux-amd64"
    'LICENSE::https://raw.githubusercontent.com/beatlabs/ergo/master/LICENSE')
sha256sums=('8107e3f08bd7f93f97ad4b6058ae4bc05af41b2f846ea77844d1346e34845710'
            '39ce0a4556170ecaa5aca48fd0327bbfc022bc6b5e2f4074ca26b24009f6fd1c')

package() {
  install -Dm755 "${srcdir}"/ergo* "${pkgdir}/usr/bin/ergo"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
