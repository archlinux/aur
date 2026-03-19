# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::${url}/releases/download/v${pkgver}/kewt")
sha256sums=('9d9088032f880c4104b5ebc5a4881be72039da8aad7ea7e3870897fffd438b0a')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
