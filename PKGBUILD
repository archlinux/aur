# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('8ccf9f240b68ebe2017258b98c006d98bace8fa1ed0221fd495ef4bf75f9ead1')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
