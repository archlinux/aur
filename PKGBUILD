# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='List of utilities for the daily developer workflow'
arch=('x86_64')
url="https://github.com/beatlabs/ergo"
license=('BSD')
provides=('ergo')
source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/ergo_${pkgver}_linux-amd64"
		'LICENSE::https://raw.githubusercontent.com/beatlabs/ergo/master/LICENSE')
sha256sums=('edf5a43c45e9dd586df271bc32e2f7f60c8fdbc029aa3d8a44d56de85c466f2a'
			'39ce0a4556170ecaa5aca48fd0327bbfc022bc6b5e2f4074ca26b24009f6fd1c')

package() {
  install -Dm755 "${srcdir}"/ergo* "${pkgdir}/usr/bin/ergo"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et: