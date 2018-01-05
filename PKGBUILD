# Maintainer:  moviuro <moviuro+archlinux@gmail.com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=factorio-dl
pkgver=0.1.0
pkgrel=1
_commit="4e3e57221bf0edf7796d5cdcef0fa81b9a6c695a"
pkgdesc="Factorio downloader script for UNIX(-like) systems"
arch=('any')
license=('custom:BSD')
depends=('curl')
install="${pkgname}.install"
url="https://gitlab.com/moviuro/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/moviuro/${pkgname}/repository/${pkgver}/archive.tar.gz"
        "${pkgname}.install")
sha256sums=('68520d754514879a265e205f2a88c54f48ce76c632c09a719d6260df2a450ec9'
            'a88bdcb2abd1b85ea1d97d10814c4233fb1186ccf6136040544965e9d7c96ce3')

package() {
  install -Dm 555 "${srcdir}/${pkgname}-${pkgver}-${_commit}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}-${pkgver}-${_commit}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 "${srcdir}/${pkgname}-${pkgver}-${_commit}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

