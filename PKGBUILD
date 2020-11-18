# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gitql-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='A git query language'
arch=('x86_64')
url="https://github.com/cloudson/gitql"
license=('MIT')
provides=('gitql')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://github.com/filhodanuvem/gitql/releases/download/${pkgver}/gitql-linux64.1.zip"
        'LICENSE::https://github.com/cloudson/gitql/raw/master/LICENSE')
sha256sums=('ecdb8bc2dd28a4d216c2ec87d4d94cfeb406657c0c39e6cb6c511dca3ac51fa8'
            'ca995d876d4738b7f7309c46f443f42bc887db327ed183fe46733a59f06f80b5')

package() {
  install -Dm755 gitql "${pkgdir}/usr/bin/gitql"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}" 
}
# vim:set ts=2 sw=2 et:
