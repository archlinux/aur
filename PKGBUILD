# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=zrok
pkgver=0.4.1
pkgrel=1
pkgdesc='An open source sharing solution built on OpenZiti'
arch=('x86_64')
url='https://github.com/openziti/zrok'
license=('Apache')
makedepends=('go')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('af1676d4da36e246601bc808b6a3e741eec8d0e4fb9e90c307266b2d8ea5b490')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
