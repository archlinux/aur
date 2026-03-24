# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('a32955318bbecd2ed764847d50d25389b58ae42792b5706b689783623878bcc6')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
