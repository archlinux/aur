# Maintainer:  moviuro <moviuro+archlinux@gmail.com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=factorio-dl
pkgver=0.1.2
pkgrel=1
_commit="4307f3600d717aa203d280a6a4db2e40ce210706"
pkgdesc="Factorio downloader script for UNIX(-like) systems"
arch=('any')
license=('custom:BSD')
depends=('curl')
install="${pkgname}.install"
url="https://gitlab.com/moviuro/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/moviuro/${pkgname}/repository/${pkgver}/archive.tar.gz"
        "${pkgname}.install")
sha256sums=('c11a2e9db961f055641acdb9c9f9ff7e164305ab9ffd30cc5ace79c9fc199f1c'
            'ae4ea5d2a613364ee7884a39c5a9e032ff7fa175b5cfb4182abf83261086ce89')

package() {
  install -Dm 555 "${srcdir}/${pkgname}-${pkgver}-${_commit}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}-${pkgver}-${_commit}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 "${srcdir}/${pkgname}-${pkgver}-${_commit}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

