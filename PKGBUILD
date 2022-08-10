# Former Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer:  Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=gomplate-bin
pkgver=3.11.2
pkgrel=2
pkgdesc='A flexible commandline tool for template rendering. Supports lots of local and remote datasources'
arch=('x86_64')
url="https://gomplate.ca"
license=('MIT')
conflicts=('gomplate')
provides=('gomplate')
source=("${pkgname}-${pkgver}::https://github.com/hairyhenderson/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_linux-amd64"
        'LICENSE::https://raw.githubusercontent.com/hairyhenderson/'${pkgname%-bin}'/main/LICENSE')
sha256sums=('53858f4c6b68a0bea0a66430760eb0948c7745f6d3052a395507e6bb9c6964a9'
            '623198523f10b6c9b0473c832634cd678b17492e77745c453aaec3f6f9d4fc20')

package() {
  install -Dm755 "${srcdir}"/gomplate* "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
