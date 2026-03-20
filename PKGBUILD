# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('6e2b776c81486fa81574c7e6cb324888eb5e6b3925a1a5823659283e94c24127')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
}
