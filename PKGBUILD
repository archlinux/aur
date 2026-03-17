# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://git.krzak.org/N0VA/kewt"
license=('MIT')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::${url}/releases/download/v${pkgver}/kewt")
sha256sums=('b33b0c58ff16e368bf981f3526e3efba7a05ed061e3fb5b2306bf87d2b0ca642')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
