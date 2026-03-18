# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://git.krzak.org/N0VA/kewt"
license=('MIT')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::${url}/releases/download/v${pkgver}/kewt")
sha256sums=('d691b17d46b316cdea5c3ce762aff383c7fbb5c7708d80713f3fe7d26a63a62a')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
