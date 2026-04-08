# Former Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer:  Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=gomplate-bin
pkgver=5.0.0
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering. Supports lots of local and remote datasources'
arch=('x86_64')
url="https://gomplate.ca"
license=('MIT')
conflicts=('gomplate')
provides=('gomplate')
source=("${pkgname}-${pkgver}::https://github.com/hairyhenderson/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_linux-amd64"
        'LICENSE::https://raw.githubusercontent.com/hairyhenderson/'${pkgname%-bin}'/main/LICENSE')
sha256sums=('084469b46bd5d7da3acd7a8255fac1fb31d3fe054d717c3d4850f14624fbb177'
            '57e484ef5a7e1055b3b7268a7d74fd63941ce76ff6a5c41adb0c19e5bd026067')

package() {
  install -Dm755 "${srcdir}"/gomplate* "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
