# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=keepasshttp
pkgver=1.8.4.1
pkgrel=1
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
arch=('any')
url="https://github.com/pfn/keepasshttp"
license=('GPL3')
depends=('keepass')
source=("https://github.com/pfn/keepasshttp/blob/${pkgver}/KeePassHttp.plgx")
md5sums=('02c34c574c32b59d16f5cd61af67549e')

package() {
  mkdir -p "${pkgdir}/usr/share/keepass/"
  install -Dm644 "${srcdir}/KeePassHttp.plgx" "${pkgdir}/usr/share/keepass/"
}

# vim:set ts=8 sts=2 sw=2 et:
