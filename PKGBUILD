# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=statusok-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Monitor your Website and APIs from your Computer. Get Notified through Slack, E-mail when your server is down or response time is more than expected"
arch=('x86_64')
url='https://github.com/sanathp/statusok'
license=('Apache-2.0')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/${pkgver}/statusok_linux.zip")
sha256sums=('d8eebddf6fefe19a80f5a40e4a8f8167325752c9e0aae07a7814630c1b269fa5')

package() {
  install -Dm755 "${srcdir}/statusok_linux/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
}