# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=klotho
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="An Infrastructure from Code CLI tool that transforms plain code into cloud native code."
arch=("any")
url="https://klo.dev/"
license=("APACHE")
source=("${pkgname}_linux_amd64::https://github.com/klothoplatform/klotho/releases/download/v${pkgver}/${pkgname}_linux_amd64")
sha256sums=('470a358e015b2f9d19643052f83a8aad76adde9b3b3fd04cdd76d7612ddf8520')

package() {
	install -Dm775 "${srcdir}/${pkgname}_linux_amd64" "${pkgdir}/usr/bin/klotho"
}
