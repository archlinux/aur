# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('f48651de936d03938d5eb7f5ddaa6138b991e0073f84bf7685808f87fb2b7c5e')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
