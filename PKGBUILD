# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>

pkgname=tgswitch-bin
_pkgname=tgswitch
pkgver=0.6.0
pkgrel=1
pkgdesc='The tgswitch command line tool lets you switch between different versions of terragrunt. Pre-compiled.'
arch=('x86_64')
url='https://github.com/warrensbox/tgswitch'
license=('MIT')
provides=('tgswitch')
conflicts=('tgswitch')
source=("$url/releases/download/${pkgver}/tgswitch_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d1513d77b64645b864b04431dc093c651f7a6bb97ef24037a7d75e90dea1601b')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
