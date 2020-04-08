# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='List of utilities for the daily developer workflow'
arch=('x86_64')
url="https://github.com/beatlabs/ergo"
license=('BSD-3-Clause')
provides=('ergo')
source=("${url}/releases/download/${pkgver}/ergo_${pkgver}_linux-amd64")
md5sums=('ce784bed661ff431a7a1c840df3af146')

package() {
	install -Dm755 "${srcdir}"/ergo* "${pkgdir}/usr/bin/ergo"
}
# vim:set ts=2 sw=2 et: