# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.0.1b
pkgrel=1
pkgdesc="A minimalist, 100% POSIX static site generator inspired by werc and kew"
arch=('any')
url="https://git.krzak.org/N0VA/kewt"
license=('MIT')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::${url}/releases/download/v${pkgver}/kewt")
sha256sums=('7428f588abd33fe37651f4a23b891b8c8f9ab09b2722e4eed5136f2f9671a096')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
