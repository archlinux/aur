# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://git.krzak.org/N0VA/kewt"
license=('MIT')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::${url}/releases/download/v${pkgver}/kewt")
sha256sums=('f5c8bf60f2af8edd84282273483ff299458fd7d741c181a03089ea4542c98bec')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
