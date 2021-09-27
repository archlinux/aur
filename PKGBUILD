# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gomplate-bin
pkgver=3.10.0
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering. Supports lots of local and remote datasources'
arch=('x86_64')
url="https://gomplate.ca"
license=('MIT')
provides=('gomplate')
source=("${pkgname}-${pkgver}::https://github.com/hairyhenderson/gomplate/releases/download/v${pkgver}/gomplate_linux-amd64"
        'LICENSE::https://github.com/hairyhenderson/gomplate/raw/master/LICENSE')
sha256sums=('eec0f85433c9c8aad93e8cd84c79d238f436b3e62f35b15471f5929bc741763a'
            '623198523f10b6c9b0473c832634cd678b17492e77745c453aaec3f6f9d4fc20')

package() {
  install -Dm755 "${srcdir}"/gomplate* "${pkgdir}/usr/bin/gomplate"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
