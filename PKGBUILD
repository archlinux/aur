# Former Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer:  Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=gomplate-bin
pkgver=4.3.1
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering. Supports lots of local and remote datasources'
arch=('x86_64')
url="https://gomplate.ca"
license=('MIT')
conflicts=('gomplate')
provides=('gomplate')
source=("${pkgname}-${pkgver}::https://github.com/hairyhenderson/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_linux-amd64"
        'LICENSE::https://raw.githubusercontent.com/hairyhenderson/'${pkgname%-bin}'/main/LICENSE')
sha256sums=('9f6c008a8ffa2574ce404acd31dd4efbdbde7aeaa867f0b8fd8dccd298cd282e'
            '57e484ef5a7e1055b3b7268a7d74fd63941ce76ff6a5c41adb0c19e5bd026067')

package() {
  install -Dm755 "${srcdir}"/gomplate* "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
