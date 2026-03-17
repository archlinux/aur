# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://git.krzak.org/N0VA/kewt"
license=('MIT')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::${url}/releases/download/v${pkgver}/kewt")
sha256sums=('ebba5d1f4f7294e453c5df49edf46e733a4daf67f41ccf28259b9504a3d208ec')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
